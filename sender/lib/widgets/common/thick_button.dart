import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

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
    this.color = color ?? col.tertiary;
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
            style: _appTextTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: col.tertiary,
          border: Border.all(
            width: 1,
            color: col.tertiary,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.5),
              blurRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}
