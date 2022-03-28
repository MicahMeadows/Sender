import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart';

class ThickButton extends StatelessWidget {
  late final Color color;
  final String text;
  final void Function()? onPressed;
  ThickButton({
    Color? color,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key) {
    this.color = color ?? primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: 170,
        child: Center(
          child: Text(
            text,
            style: _appTextTheme.bodyText1,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 0,
              offset: const Offset(4, 4),
            ),
          ],
        ),
      ),
    );
  }
}
