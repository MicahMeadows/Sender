import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

import 'base_card.dart';

class LabledCard extends StatelessWidget {
  final String title;
  final Widget content;
  final double padding;
  final TextStyle? style;

  static const _defaultTextStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    color: col.text1,
  );

  const LabledCard({
    required this.title,
    required this.content,
    this.style = _defaultTextStyle,
    this.padding = 12,
    Key? key,
  }) : super(key: key);

  factory LabledCard.text(
      {required String title,
      required String content,
      double? padding,
      TextStyle? style = _defaultTextStyle}) {
    return LabledCard(
      title: title,
      content: Text(
        content,
        style: style,
        textAlign: TextAlign.end,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 3),
      child: BaseCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: style,
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: Align(alignment: Alignment.centerRight, child: content)
                  // child: Text(
                  //   content,
                  //   style: style,
                  //   textAlign: TextAlign.end,
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
