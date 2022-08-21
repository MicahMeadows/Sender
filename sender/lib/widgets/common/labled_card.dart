import 'package:flutter/material.dart';
import 'package:sender/common/constants/text.dart' as txt;

import 'base_card.dart';

enum LabledCardSidePriority {
  right,
  left,
}

class LabledCard extends StatelessWidget {
  final String title;
  final Widget child;
  final TextStyle? style;
  final LabledCardSidePriority sidePriority;

  const LabledCard({
    required this.title,
    required this.child,
    this.sidePriority = LabledCardSidePriority.right,
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

  Widget _buildLeftSide() {
    var child = Text(
      title,
      style: style,
    );
    if (sidePriority == LabledCardSidePriority.left) {
      return Expanded(child: child);
    } else {
      return child;
    }
  }

  Widget _buildRightSide() {
    var child = Align(
      alignment: Alignment.centerRight,
      child: this.child,
    );

    if (sidePriority == LabledCardSidePriority.right) {
      return Expanded(child: child);
    }
    return child;
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
            _buildLeftSide(),
            const SizedBox(width: 15),
            _buildRightSide(),
          ],
        ),
      ),
    );
  }
}
