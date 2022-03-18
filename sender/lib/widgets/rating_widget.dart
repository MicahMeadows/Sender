import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart';

class RatingWidget extends StatelessWidget {
  final double height;
  final double rating;
  const RatingWidget({required this.rating, this.height = 18, Key? key})
      : super(key: key);

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
    return Row(
      children: [
        for (int i = 0; i < _numFullStars; i++)
          Icon(Icons.star_rounded, color: ratingStarColor, size: height),
        if (_hasHalfStar)
          Icon(
            Icons.star_half_rounded,
            color: ratingStarColor,
            size: height,
          ),
      ],
    );
  }
}
