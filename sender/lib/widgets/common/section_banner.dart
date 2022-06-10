import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class SectionBanner extends StatelessWidget {
  final String text;
  final Widget? trailing;
  final Color color;
  const SectionBanner({
    required this.text,
    this.color = col.tertiary,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      color: color,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              text,
              style: _appTextTheme.bodySmall?.copyWith(color: col.text1),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
