import 'package:flutter/material.dart';
import 'package:sender/widgets/common/base_card.dart';
import 'package:sender/common/constants/text.dart' as txt;

class TitledCard extends StatelessWidget {
  final Widget child;
  final String title;
  final double gap;
  const TitledCard({
    required this.title,
    required this.child,
    this.gap = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: txt.cardHeader,
            ),
          ),
          SizedBox(height: gap),
          child,
        ],
      ),
    );
  }
}
