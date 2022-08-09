import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class ThickButton extends StatelessWidget {
  final Color mainColor;
  late Color shadowColor;
  final Color textColor;
  final String text;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final EdgeInsets padding;
  ThickButton({
    this.textColor = Colors.white,
    this.mainColor = col.accent,
    Color? shadowColor,
    this.width, // = 170,
    this.height, // = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key) {
    this.shadowColor = shadowColor ?? mainColor.withOpacity(.5);
  }

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          padding: this.padding,
          height: height,
          width: width,
          child: Center(
            child: Text(
              text,
              style: _appTextTheme.bodySmall?.copyWith(color: textColor),
            ),
          ),
          decoration: BoxDecoration(
            color: mainColor,
            border: Border.all(
              width: 1,
              color: mainColor,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
