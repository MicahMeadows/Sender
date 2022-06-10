import 'package:flutter/material.dart';
import 'package:sender/widgets/common/base_card.dart';

class TitledCard extends StatelessWidget {
  final Widget child;
  final String title;
  const TitledCard({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          Text(title),
          child,
        ],
      ),
    );
  }
}
