import 'package:flutter/material.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/widgets/card/route_card.dart';
import 'package:sender/widgets/pages/route_detail/route_details_page.dart';

import '../../data/models/climbing_route/climbing_route.dart';
import '../../data/models/route_tick/route_tick.dart';

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
    widget.todoCubit.setTick(
      RouteTick.makeTick('skip', route),
    );
    widget.queueCubit.popRoute();
    widget.onRoutesChanged?.call(widget.routes);
  }

  void handleRightSwipe(ClimbingRoute route) {
    widget.todoCubit.setTick(
      RouteTick.makeTick('like', route),
    );
    widget.queueCubit.popRoute();
    widget.onRoutesChanged?.call(widget.routes);
  }

  void handleUpSwipe(ClimbingRoute route) {
    widget.todoCubit.setTick(
      RouteTick.makeTick('todo', route),
    );
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (int i = widget.routes.length - 1; i >= 0; i--)
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: RouteCard(
                ignoredDirections: const [
                  SwipeDirection.down,
                ],
                onSwipe: (direction) {
                  ClimbingRoute currentRoute = widget.routes[i];
                  if (direction == SwipeDirection.left) {
                    handleLeftSwipe(currentRoute);
                  }
                  if (direction == SwipeDirection.right) {
                    handleRightSwipe(currentRoute);
                  }
                  if (direction == SwipeDirection.up) {
                    handleUpSwipe(currentRoute);
                  }
                  if (direction == SwipeDirection.down) {
                    // handleDownSwipe(i);
                  }
                },
                route: widget.routes[i],
              ),
            ),
          ),
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
