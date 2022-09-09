import 'package:flutter/material.dart';
import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:sender/widgets/pages/route_detail/detail_section.dart';
import 'package:sender/widgets/pages/route_detail/route_details_page.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/pages/route_detail/text_card.dart';

import '../../common/labled_card.dart';
import '../../common/rating_widget.dart';
import '../../common/section_banner.dart';
import '../../common/thick_button.dart';

class CustomDetailsList extends StatelessWidget {
  final ClimbingRoute route;
  final double sidePadding;
  final double animValue;
  final List<BottomOption> bottomOptions;

  const CustomDetailsList({
    required this.sidePadding,
    required this.animValue,
    required this.route,
    required this.bottomOptions,
    Key? key,
  }) : super(key: key);

  Widget _buildLabledCard(String title, String content, TextTheme textTheme) {
    return LabledCard.text(
      title: title,
      content: content,
      style: textTheme.bodySmall?.apply(color: col.text1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SliverList(
      delegate: SliverChildListDelegate([
        if (route.rating != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingWidget(
              rating: route.rating!,
              height: 25,
              color: col.accent,
            ),
          ),
        const SizedBox(height: 5),
        const SectionBanner(text: 'Details'),
        const SizedBox(height: 3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(
            children: [
              if (route.type != null)
                _buildLabledCard('Type:', route.type!, theme),
              _buildLabledCard(
                  'Height:',
                  route.length == null
                      ? 'Unknown height'
                      : '${route.length.toString()}ft',
                  theme),
              if (route.grade != null)
                _buildLabledCard('Grade:', route.grade!, theme),
              if (route.firstAscent != null)
                _buildLabledCard('First Ascent:', route.firstAscent!, theme),
            ],
          ),
        ),
        const SizedBox(height: 23),
        const SectionBanner(text: 'Area'),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var area in route.areas ?? []) TextCard(text: area.name)
              ],
            ),
          ),
        ),
        const SizedBox(height: 23),
        for (var detail in route.details ?? [])
          DetailSection(sidePadding: sidePadding, detail: detail),
        const SizedBox(height: 30),
        for (var option in bottomOptions)
          ThickButton(text: option.buttonText, onPressed: option.onPress),
        const SizedBox(height: 50),
      ]
          .map((e) => Opacity(
                opacity: animValue,
                child: Container(
                  color: col.primary,
                  child: e,
                ),
              ))
          .toList()),
    );
  }
}
