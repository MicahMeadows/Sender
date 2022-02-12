import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widget/breadcrumbs.dart';
import 'package:sender/widget/rating_widget.dart';

class SwipeableCard extends StatefulWidget {
  final ClimbingRoute route = const ClimbingRoute(
    name: 'Different Strokes',
    grade: '5.11c',
    description:
        'Climb the enjoyable face making use of side pulls and pinches the whole way up. Awesome route.',
    type: 'Sport',
    height: '50ft (15 m)',
    firstAscent: 'Terry Kindred - 2001',
    averageRating: 3,
    imageUrls: [
      'https://cdn2.apstatic.com/photos/climb/106860992_large_1494146441.jpg',
      'https://cdn2.apstatic.com/photos/climb/119791512_large_1603427278.jpg',
      'https://cdn2.apstatic.com/photos/climb/116166209_large_1544139626.jpg',
    ],
    area: [
      'Kentucky',
      'Red River Gorge',
      'Pendergrass-Murray Recreational Preserve (PMRP)',
      'Gallery',
    ],
  );

  const SwipeableCard({Key? key}) : super(key: key);

  @override
  State<SwipeableCard> createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipeableCard> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Image.network(
                widget.route.imageUrls[_pageIndex],
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [.7, 1],
                  colors: [
                    Colors.black38,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.route.name,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    Text(
                      widget.route.grade,
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    RatingWidget(rating: widget.route.averageRating),
                    const SizedBox(height: 8)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Breadcrumbs(
                itemCount: widget.route.imageUrls.length,
                index: _pageIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
