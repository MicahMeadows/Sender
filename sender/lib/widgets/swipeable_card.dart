import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widgets/breadcrumbs.dart';
import 'package:sender/widgets/rating_widget.dart';

class SwipeableCard extends StatefulWidget {
  final ClimbingRoute route;
  final void Function(DragUpdateDetails details)? onPositionChanged;
  final void Function(Offset, DragEndDetails)? onSwipeCancel;
  final void Function(Offset)? onSwipeLeft;
  final void Function(Offset)? onSwipeRight;
  final double? offsetAngle;

  const SwipeableCard({
    required this.route,
    this.offsetAngle,
    this.onSwipeCancel,
    this.onPositionChanged,
    this.onSwipeLeft,
    this.onSwipeRight,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeableCard> createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipeableCard> {
  int _pageIndex = 0;
  final List<Image> _routeImages = [];

  void _nextPage() {
    if (_pageIndex < widget.route.imageUrls.length - 1) {
      setState(() {
        _pageIndex++;
      });
    }
  }

  void _previousPage() {
    if (_pageIndex > 0) {
      setState(() {
        _pageIndex--;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    for (var imageUrl in widget.route.imageUrls) {
      _routeImages.add(
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in _routeImages) {
      precacheImage(image.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      animationCurve: Curves.easeInCubic,
      onSwipeCancel: widget.onSwipeCancel,
      onPositionChanged: widget.onPositionChanged,
      onSwipeRight: widget.onSwipeRight,
      onSwipeLeft: widget.onSwipeLeft,
      verticalSwipe: false,
      animationDuration: 150,
      child: Transform.rotate(
        angle: widget.offsetAngle ?? 0,
        child: GestureDetector(
          onTapUp: (details) {
            if (details.globalPosition.dx >
                MediaQuery.of(context).size.width / 2) {
              _nextPage();
            } else {
              _previousPage();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [cardGradientTop, cardGradientBottom],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(35)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: _routeImages[_pageIndex],
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
                            Colors.black45,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: currentPageInfo,
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
            ),
          ),
        ),
      ),
    );
  }

  Widget get currentPageInfo {
    if (_pageIndex == 0) return pageOneInfo;
    if (_pageIndex == 1) return pageTwoInfo;
    if (_pageIndex == 2) return pageThreeInfo;
    return const SizedBox.shrink();
  }

  Widget get pageOneInfo {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          widget.route.name,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 36,
            height: .5,
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
        RatingWidget(rating: widget.route.rating),
        const SizedBox(height: 8)
      ],
    );
  }

  Widget get pageTwoInfo {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          '${widget.route.height.toString()}ft',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 36,
            height: .5,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'FA: ${widget.route.firstAscent}',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }

  Widget get pageThreeInfo {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Description:',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 24,
            height: .5,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          widget.route.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
