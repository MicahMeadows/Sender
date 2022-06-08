import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class RatingWidget extends StatelessWidget {
  final double height;
  final double rating;
  late final Color color;
  RatingWidget({
    required this.rating,
    Color? color,
    this.height = 18,
    Key? key,
  }) : super(key: key) {
    this.color = color ?? col.tertiary;
  }

  int get _numFullStars {
    return rating.floor();
  }

  bool get _hasHalfStar {
    if (_numFullStars < 5) {
      if (rating - _numFullStars > 0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < _numFullStars; i++)
            Icon(Icons.star_rounded, color: color, size: height),
          if (_hasHalfStar)
            Icon(
              Icons.star_half_rounded,
              color: color,
              size: height,
            ),
        ],
      ),
    );
  }
}
