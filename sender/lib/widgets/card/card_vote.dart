import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/widgets/card/swipeable_card.dart';
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

  // late final _queueCubit = context.read<RouteQueueCubit>();

  double get _cardRotationAngle {
    if (posFromStart == null) {
      return 0;
    }
    Size screenSize = MediaQuery.of(context).size;

    Offset screenMiddle = Offset(screenSize.width / 2, screenSize.height / 2);

    Offset cardMiddlePos = screenMiddle + posFromStart!;

    num dX = cardMiddlePos.dx - screenSize.width / 2;
    num dY = cardMiddlePos.dy + 250;

    return atan2(dX, dY);
  }

  void _resetSwipePosition() {
    setState(() {
      posFromStart = null;
      startPos = null;
    });
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
              child: SwipeableCard(
                offsetAngle: i == 0 ? _cardRotationAngle : 0,
                onSwipeUp: (_) {
                  widget.todoCubit.setTick(
                    RouteTick.makeTick('sent', widget.routes[i]),
                  );
                  widget.queueCubit.popRoute();
                  _resetSwipePosition();
                  widget.onRoutesChanged?.call(widget.routes);
                },
                onSwipeDown: (_) {
                  _resetSwipePosition();
                  Navigator.of(context)
                      .push(
                    _createDetailsRoute(i),
                  )
                      .then((value) {
                    setState(() {
                      debugPrint('detail closed');
                    });
                  });
                  widget.onRoutesChanged?.call(widget.routes);
                },
                onSwipeLeft: (_) {
                  widget.todoCubit.setTick(
                    RouteTick.makeTick('skip', widget.routes[i]),
                  );
                  widget.queueCubit.popRoute();
                  _resetSwipePosition();
                  widget.onRoutesChanged?.call(widget.routes);
                },
                onSwipeRight: (_) {
                  widget.todoCubit.setTick(
                    RouteTick.makeTick('todo', widget.routes[i]),
                  );
                  widget.queueCubit.popRoute();
                  _resetSwipePosition();
                  widget.onRoutesChanged?.call(widget.routes);
                },
                onPositionChanged: (details) {
                  startPos ??= details.localPosition;
                  setState(() {
                    posFromStart = details.localPosition - startPos!;
                  });
                },
                onSwipeCancel: (offset, details) {
                  _resetSwipePosition();
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
