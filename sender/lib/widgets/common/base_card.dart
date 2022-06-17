import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class BaseCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color color;
  const BaseCard({
    required this.child,
    this.margin = const EdgeInsets.only(bottom: 9),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.color = col.secondary,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
      // margin: margin,
      child: child,
    );
  }
}
