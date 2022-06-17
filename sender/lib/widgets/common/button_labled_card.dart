import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

import 'labled_card.dart';

class ButtonLabledCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final void Function() onTap;
  const ButtonLabledCard({
    required this.title,
    required this.buttonText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabledCard(
      title: title,
      child: InkWell(
        onTap: onTap,
        child: Text(
          buttonText,
          style: const TextStyle(
              color: col.accent, fontSize: 14, fontFamily: 'Nunito'),
        ),
      ),
    );
  }
}
