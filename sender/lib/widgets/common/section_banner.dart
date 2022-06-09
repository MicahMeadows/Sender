import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;

class SectionBanner extends StatelessWidget {
  final String text;
  final Widget? trailing;
  const SectionBanner({
    required this.text,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      color: col.secondary,
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
