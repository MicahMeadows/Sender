import 'package:flutter/material.dart';
import 'package:sender/widgets/common/labled_card.dart';
import 'package:sender/common/constants/colors.dart' as col;

class LabledToggleCard extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool value)? onChanged;

  const LabledToggleCard({
    required this.title,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabledCard(
      title: title,
      child: Switch(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        activeColor: col.accent,
        inactiveThumbColor: col.text2,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
