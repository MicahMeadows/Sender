import 'package:flutter/material.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widget/home_page.dart';
import 'package:sender/widget/swipeable_card.dart';

class CardVote extends StatefulWidget {
  final List<ClimbingRoute> routes;

  const CardVote({required this.routes, Key? key}) : super(key: key);

  @override
  State<CardVote> createState() => _CardVoteState();
}

class _CardVoteState extends State<CardVote> {
  Offset? startPos;
  Offset? posFromStart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = routes.length - 1; i >= 0; i--)
            Positioned(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                child: SwipeableCard(
                  route: widget.routes[i],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
