import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class RoundButton extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final void Function() onTap;

  static const double _defaultSize = 32.0;

  const RoundButton({
    required this.child,
    required this.onTap,
    this.width,
    this.height = _defaultSize,
    Key? key,
  }) : super(key: key);

  factory RoundButton.circular({
    required Widget child,
    required void Function() onTap,
    double size = _defaultSize,
    Key? key,
  }) {
    return RoundButton(
      child: child,
      onTap: onTap,
      height: size,
      width: size,
      key: key,
    );
  }

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: col.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 4,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
