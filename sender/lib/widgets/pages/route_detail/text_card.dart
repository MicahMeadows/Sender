import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

import '../../common/base_card.dart';

class TextCard extends StatelessWidget {
  final double? width;
  final String text;
  const TextCard({
    this.width,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BaseCard(
      width: width,
      child: Text(
        text,
        style: theme.bodySmall?.apply(color: col.text1),
      ),
    );
  }
}
