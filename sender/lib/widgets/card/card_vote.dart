import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/widgets/card/route_card.dart';
import 'package:sender/widgets/common/fading_widget.dart';
import 'package:sender/widgets/pages/route_detail/route_details_page.dart';
import 'package:sender/widgets/swipe_feedback.dart';

import '../../data/cubits/navigation/navigation_cubit.dart';
import '../../data/models/climbing_route/climbing_route.dart';
import '../common/knot_progress_indicator.dart';
import '../pages/home/no_results.dart';
import '../pages/home/queue_error.dart';

class CardVote extends StatefulWidget {
  final void Function(List<ClimbingRoute> newRoutes)? onRoutesChanged;

  const CardVote({
    this.onRoutesChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CardVote> createState() => _CardVoteState();
}

class _CardVoteState extends State<CardVote> {
  late TodoListCubit todoCubit = context.read<TodoListCubit>();
  late RouteQueueCubit queueCubit = context.read<RouteQueueCubit>();

  Offset? startPos;
  Offset? posFromStart;
  late OverlayState? overlayState = Overlay.of(context);

  void handleLeftSwipe(ClimbingRoute route) {
    todoCubit.setSkip(route);
    queueCubit.popRoute();
    addFadingCenterWidget(Image.asset('assets/images/skip-response.png'));
  }

  void addFadingCenterWidget(Widget widget) {
    late OverlayEntry entry;

    setState(() {
      entry = OverlayEntry(builder: (ctx) {
        return FadingWidget(
          animationCurve: Curves.easeInExpo,
          animationDuration: const Duration(milliseconds: 800),
          child: widget,
          onComplete: () {
            entry.remove();
          },
          onUpdate: () {
            entry.markNeedsBuild();
          },
        );
      });

      overlayState?.insert(entry);
    });
  }

  void handleRightSwipe(ClimbingRoute route) {
    todoCubit.setLiked(route);
    queueCubit.popRoute();
    addFadingCenterWidget(Image.asset('assets/images/heart-response.png'));
  }

  void handleUpSwipe(ClimbingRoute route) {
    todoCubit.setTodo(route);
    queueCubit.popRoute();
    // widget.onRoutesChanged?.call(widget.routes);
  }

  void handleDownSwipe(int routeIndex, List<ClimbingRoute> routes) {
    Navigator.of(context)
        .push(
      _createDetailsRoute(routeIndex, routes),
    )
        .then((value) {
      setState(() {
        debugPrint('detail closed');
      });
    });
    // widget.onRoutesChanged?.call(widget.routes);
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
    return BlocBuilder<RouteQueueCubit, RouteQueueState>(
      builder: (context, state) {
        if (state is RouteQueueLoaded) {
          int routeCount = state.routes.length;
          ClimbingRoute? topRoute = routeCount >= 1 ? state.routes[0] : null;
          ClimbingRoute? backupRoute = routeCount >= 2 ? state.routes[1] : null;
          return Stack(
            // clipBehavior: Clip.none,
            children: [
              if (backupRoute != null) _createRouteWidget(backupRoute),
              if (topRoute != null) _createRouteWidget(topRoute),
            ],
          );
        }

        if (state is RouteQueueLoading) {
          return const KnotProgressIndicator(
            color: Colors.white,
          );
        }
        if (state is RouteQueueEmpty) {
          return NoQueueResults(
            navigationCubit: context.read<NavigationCubit>(),
            queueCubit: context.read<RouteQueueCubit>(),
          );
        }
        return const QueueError();
      },
    );
  }

  Route _createDetailsRoute(int idx, List<ClimbingRoute> routes) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          RouteDetailsPage(route: routes[idx]),
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
