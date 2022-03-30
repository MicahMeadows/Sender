import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const BaseCard({
    required this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
