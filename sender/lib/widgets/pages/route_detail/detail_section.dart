import 'package:flutter/material.dart';
import 'package:sender/data/models/climbing_route_detail/climbing_route_detail.dart';
import 'package:sender/widgets/pages/route_detail/text_card.dart';

import '../../common/section_banner.dart';

class DetailSection extends StatelessWidget {
  final ClimbingRouteDetail detail;
  final double sidePadding;
  const DetailSection({
    required this.sidePadding,
    required this.detail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionBanner(text: detail.title),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          // child: _buildTextCard(detail.content, width: double.infinity),
          child: TextCard(
            text: detail.content,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
