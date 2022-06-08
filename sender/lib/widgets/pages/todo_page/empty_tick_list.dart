import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/common/shadow_image.dart';

class EmptyTickList extends StatelessWidget {
  final Widget image;
  final double imageWidth;
  final String title;
  final String body;
  const EmptyTickList({
    required this.image,
    required this.title,
    this.imageWidth = 80,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(flex: 1),
          ShadowImage(
            child: SizedBox(
              width: imageWidth,
              child: image,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: col.text1,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: col.text2,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
