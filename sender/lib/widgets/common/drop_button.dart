import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/common/round_button.dart';

class DropButton extends StatefulWidget {
  final String title;
  final bool value;
  const DropButton({
    required this.title,
    this.value = false,
    Key? key,
  }) : super(key: key);

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  late bool isOpen = widget.value;
  @override
  Widget build(BuildContext context) {
    return RoundButton(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: col.text1,
                ),
              ),
            ),
            Icon(
              isOpen
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: col.text2,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
