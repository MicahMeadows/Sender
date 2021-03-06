import 'package:flutter/material.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/widgets/card/route_card.dart';
import 'package:sender/widgets/pages/route_detail/route_details_page.dart';

import '../../data/models/climbing_route/climbing_route.dart';

class CardVote extends StatefulWidget {
  final TodoListCubit todoCubit;
  final RouteQueueCubit queueCubit;
  final List<ClimbingRoute> routes;
  final void Function(List<ClimbingRoute> newRoutes)? onRoutesChanged;

  const CardVote({
    required this.routes,
    required this.todoCubit,
    required this.queueCubit,
    this.onRoutesChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CardVote> createState() => _CardVoteState();
}

class _CardVoteState extends State<CardVote> {
  Offset? startPos;
  Offset? posFromStart;

  void handleLeftSwipe(ClimbingRoute route) {
    widget.todoCubit.setSkip(route);
    widget.queueCubit.popRoute();
    widget.onRoutesChanged?.call(widget.routes);
  }

  void handleRightSwipe(ClimbingRoute route) {
    widget.todoCubit.setLiked(route);
    widget.queueCubit.popRoute();
    widget.onRoutesChanged?.call(widget.routes);
  }

  void handleUpSwipe(ClimbingRoute route) {
    widget.todoCubit.setTodo(route);
    widget.queueCubit.popRoute();
    widget.onRoutesChanged?.call(widget.routes);
  }

  void handleDownSwipe(int routeIndex) {
    Navigator.of(context)
        .push(
      _createDetailsRoute(routeIndex),
    )
        .then((value) {
      setState(() {
        debugPrint('detail closed');
      });
    });
    widget.onRoutesChanged?.call(widget.routes);
  }

  Widget _createRouteWidget(ClimbingRoute route) {
    return Positioned(
      key: ValueKey<String>(route.id),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: RouteCard(
          nonDestructiveDirections: const [
            SwipeDirection.down,
          ],
          onSwipe: (direction) {
            // ClimbingRoute currentRoute = widget.routes[i];
            if (direction == SwipeDirection.left) {
              handleLeftSwipe(route);
            }
            if (direction == SwipeDirection.right) {
              handleRightSwipe(route);
            }
            if (direction == SwipeDirection.up) {
              handleUpSwipe(route);
            }
            if (direction == SwipeDirection.down) {
              // handleDownSwipe(i);
            }
          },
          route: route,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int routeCount = widget.routes.length;

    ClimbingRoute? topRoute = routeCount >= 1 ? widget.routes[0] : null;
    ClimbingRoute? backupRoute = routeCount >= 2 ? widget.routes[1] : null;
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        if (backupRoute != null) _createRouteWidget(backupRoute),
        if (topRoute != null) _createRouteWidget(topRoute),
      ],
    );
  }

  Route _createDetailsRoute(int idx) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          RouteDetailsPage(route: widget.routes[idx]),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, -1);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
