import 'package:flutter/material.dart';

class Breadcrums extends StatelessWidget {
  final int itemCount;
  final int index;
  const Breadcrums({required this.itemCount, required this.index, Key? key})
      : super(key: key);

  bool get renderOne {
    return index >= 2;
  }

  bool get renderTwo {
    return index >= 1;
  }

  bool get renderThree {
    return itemCount > 1;
  }

  bool get renderFour {
    return itemCount >= 3 && index < itemCount - 1;
  }

  bool get renderFive {
    return itemCount >= 4 && index < itemCount - 2;
  }

  Widget get outsideCircle {
    return const Padding(
      padding: EdgeInsets.all(1.0),
      child: Icon(Icons.circle, color: Colors.white38, size: 4),
    );
  }

  Widget get innerOutsideCircle {
    return const Padding(
      padding: EdgeInsets.all(1.0),
      child: Icon(Icons.circle, color: Colors.white70, size: 7),
    );
  }

  Widget get middleCircle {
    return const Padding(
      padding: EdgeInsets.all(1.0),
      child: Icon(Icons.circle, color: Colors.white, size: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (renderOne) outsideCircle,
        if (renderTwo) innerOutsideCircle,
        if (renderThree) middleCircle,
        if (renderFour) innerOutsideCircle,
        if (renderFive) outsideCircle,
      ],
    );
  }
}
