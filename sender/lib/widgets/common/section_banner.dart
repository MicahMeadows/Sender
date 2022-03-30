import 'package:flutter/material.dart';

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
      color: const Color(0xfff4f4f4),
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              text,
              style: _appTextTheme.bodySmall,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
