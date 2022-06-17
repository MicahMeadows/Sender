import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class RatingWidget extends StatelessWidget {
  final double height;
  final double rating;
  final int? numStarsShow;
  late final Color color;
  RatingWidget({
    required this.rating,
    Color? color,
    this.height = 18,
    this.numStarsShow,
    Key? key,
  }) : super(key: key) {
    this.color = color ?? col.accent;
  }

  int get _numFullStars {
    return rating.floor();
  }

  int? get _numEmptyStars {
    var numStarsToShow = numStarsShow;
    if (numStarsToShow == null) {
      return null;
    }

    int numUsedStars = rating.ceil();
    return numStarsToShow - numUsedStars;
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
          for (int i = 0; i < (_numEmptyStars ?? 0); i++)
            Icon(
              Icons.star_border_rounded,
              size: height,
              color: color,
            ),
        ],
      ),
    );
  }
}
