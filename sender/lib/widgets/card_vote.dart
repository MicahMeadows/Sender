import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widgets/swipeable_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardVote extends StatefulWidget {
  final List<ClimbingRoute> routes;

  const CardVote({required this.routes, Key? key}) : super(key: key);

  @override
  State<CardVote> createState() => _CardVoteState();
}

class _CardVoteState extends State<CardVote> {
  Offset? startPos;
  Offset? posFromStart;

  late final _queueCubit = context.read<RouteQueueCubit>();

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
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = widget.routes.length - 1; i >= 0; i--)
            Positioned(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                child: SwipeableCard(
                  offsetAngle: i == 0 ? _cardRotationAngle : 0,
                  onSwipeLeft: (_) {
                    _queueCubit.declineRoute();
                    _resetSwipePosition();
                  },
                  onSwipeRight: (_) {
                    _queueCubit.declineRoute();
                    _resetSwipePosition();
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
      ),
    );
  }
}
