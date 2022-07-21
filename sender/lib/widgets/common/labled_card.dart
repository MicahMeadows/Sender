import 'package:flutter/material.dart';
import 'package:sender/common/constants/text.dart' as txt;

import 'base_card.dart';

class LabledCard extends StatelessWidget {
  final String title;
  final Widget child;
  final TextStyle? style;

  const LabledCard({
    required this.title,
    required this.child,
    this.style = txt.cardHeader,
    Key? key,
  }) : super(key: key);

  factory LabledCard.text(
      {required String title,
      required String content,
      double? padding,
      TextStyle? style = txt.cardHeader}) {
    return LabledCard(
      title: title,
      child: Text(
        content,
        style: style,
        textAlign: TextAlign.end,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: style,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
