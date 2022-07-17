import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/widgets/common/breadcrumbs.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/rating_widget.dart';

import '../../data/models/climbing_route/climbing_route.dart';

class SwipeableCard extends StatefulWidget {
  final ClimbingRoute route;
  final void Function(DragUpdateDetails details)? onPositionChanged;
  final void Function(Offset, DragEndDetails)? onSwipeCancel;
  final void Function(Offset)? onSwipeLeft;
  final void Function(Offset)? onSwipeRight;
  final void Function(Offset)? onSwipeUp;
  final void Function(Offset)? onSwipeDown;
  final double? offsetAngle;

  const SwipeableCard({
    required this.route,
    this.offsetAngle,
    this.onSwipeCancel,
    this.onPositionChanged,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeDown,
    this.onSwipeUp,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeableCard> createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipeableCard> {
  late OverlayState? overlayState = Overlay.of(context);
  OverlayEntry? overlayEntry;

  Offset dragOffset = Offset.zero;
  Offset dragStartOffset = Offset.zero;

  GlobalKey cardKey = GlobalKey();
  Size? loadedSize;
  Offset? loadedOrigin;

  int _pageIndex = 0;
  final List<Image> _routeImages = [];

  void _nextPage() {
    if (_pageIndex < (widget.route.imageUrls?.length ?? 0) - 1) {
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

  void onLoadScreen(Duration timestamp) {
    final container = cardKey.currentContext?.findRenderObject() as RenderBox?;

    loadedSize = container?.size;
    loadedOrigin = container?.localToGlobal(Offset.zero);

    debugPrint('loadedSize: $loadedSize');
  }

  @override
  void initState() {
    super.initState();

    for (var imageUrl in widget.route.imageUrls ?? []) {
      _routeImages.add(
        Image.network(
          imageUrl,
          loadingBuilder: (ctx, widget, progress) {
            if (progress == null) {
              return widget;
            }
            return const Center(child: KnotProgressIndicator());
          },
          fit: BoxFit.cover,
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback(onLoadScreen);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in _routeImages) {
      precacheImage(image.image, context);
    }
  }

  void removeOverlay() {
    if (overlayState != null) {
      if (overlayEntry != null) {
        if (overlayEntry!.mounted) {
          overlayEntry!.remove();
          overlayEntry = null;
        }
      }
    }
  }

  double get _cardRotationAngle {
    if (dragOffset == Offset.zero) {
      return 0;
    }
    Size screenSize = MediaQuery.of(context).size;

    Offset screenMiddle = Offset(screenSize.width / 2, screenSize.height / 2);

    Offset cardMiddlePos = screenMiddle + dragOffset;

    num dX = cardMiddlePos.dx - screenSize.width / 2;
    num dY = cardMiddlePos.dy + 250;

    return atan2(dX, dY);
  }

  void endDrag() {
    removeOverlay();
    setState(() {
      dragOffset = loadedOrigin ?? Offset.zero;
    });
  }

  void dragEnd(DragEndDetails details) {
    endDrag();
  }

  void dragUpdate(DragUpdateDetails details) {
    dragOffset =
        (loadedOrigin ?? Offset.zero) + details.localPosition - dragStartOffset;
    overlayEntry?.markNeedsBuild();
  }

  void createOverlayEntry() {
    debugPrint(loadedOrigin?.dx.toString());
    overlayEntry = OverlayEntry(builder: (ctx) {
      return Positioned(
        width: loadedSize != null ? loadedSize!.width : null,
        height: loadedSize != null ? loadedSize!.height : null,
        left: dragOffset.dx,
        top: dragOffset.dy,
        child: Transform.rotate(
          angle: _cardRotationAngle,
          child: buildCardWidget(context),
        ),
      );
    });

    overlayState?.insert(overlayEntry!);
    setState(() {});
  }

  void dragStart(DragStartDetails details) {
    dragStartOffset = details.localPosition;
    dragOffset = loadedOrigin ?? Offset.zero;
    if (loadedOrigin != null) {
      createOverlayEntry();
    }
  }

  Widget buildCardWidget(BuildContext context) {
    return Material(
      color: Colors.transparent,
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
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamed(RouteDetailsPage.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: currentPageInfo,
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
                  itemCount: widget.route.imageUrls?.length ?? 0,
                  index: _pageIndex,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: cardKey,
      child: GestureDetector(
        onVerticalDragStart: dragStart,
        onHorizontalDragStart: dragStart,
        onVerticalDragEnd: dragEnd,
        onHorizontalDragEnd: dragEnd,
        onHorizontalDragUpdate: dragUpdate,
        onVerticalDragUpdate: dragUpdate,
        child: GestureDetector(
          onTapUp: (details) {
            if (details.globalPosition.dx >
                MediaQuery.of(context).size.width / 2) {
              _nextPage();
            } else {
              _previousPage();
            }
          },
          child: Offstage(
            offstage: overlayEntry?.mounted ?? false,
            child: buildCardWidget(context),
          ),
        ),
        // child: Transform.rotate(
        //   angle: widget.offsetAngle ?? 0,
        //   child: GestureDetector(
        //     onTapUp: (details) {
        //       if (details.globalPosition.dx >
        //           MediaQuery.of(context).size.width / 2) {
        //         _nextPage();
        //       } else {
        //         _previousPage();
        //       }
        //     },
        //     child: buildCardWidget(context),
        //   ),
        // ),
      ),
    );
    // return Swipable(
    //   onSwipeEnd: (_, __) {
    //     setState(() {});
    //   },
    //   animationCurve: Curves.easeInCubic,
    //   onSwipeCancel: widget.onSwipeCancel,
    //   onPositionChanged: widget.onPositionChanged,
    //   onSwipeRight: widget.onSwipeRight,
    //   onSwipeLeft: widget.onSwipeLeft,
    //   onSwipeDown: (finalPos) {
    //     _handleVerticalSwipe(finalPos);
    //   },
    //   onSwipeUp: (finalPos) {
    //     _handleVerticalSwipe(finalPos);
    //   },
    //   animationDuration: 150,
    //   child: Transform.rotate(
    //     angle: widget.offsetAngle ?? 0,
    //     child: GestureDetector(
    //       onTapUp: (details) {
    //         if (details.globalPosition.dx >
    //             MediaQuery.of(context).size.width / 2) {
    //           _nextPage();
    //         } else {
    //           _previousPage();
    //         }
    //       },
    //       child: ClipRRect(
    //         borderRadius: const BorderRadius.all(Radius.circular(30)),
    //         child: Stack(
    //           children: [
    //             Positioned.fill(
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   color: Colors.white,
    //                 ),
    //                 child: _routeImages[_pageIndex],
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               right: 0,
    //               left: 0,
    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   gradient: LinearGradient(
    //                     begin: Alignment.bottomCenter,
    //                     end: Alignment.topCenter,
    //                     stops: [.7, 1],
    //                     colors: [
    //                       Colors.black45,
    //                       Colors.transparent,
    //                     ],
    //                   ),
    //                 ),
    //                 child: GestureDetector(
    //                   behavior: HitTestBehavior.opaque,
    //                   onTap: () {
    //                     // Navigator.of(context)
    //                     //     .pushNamed(RouteDetailsPage.routeName);
    //                   },
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(19.0),
    //                     child: currentPageInfo,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               left: 0,
    //               right: 0,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Breadcrumbs(
    //                   itemCount: widget.route.imageUrls?.length ?? 0,
    //                   index: _pageIndex,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
        FittedBox(
          child: Text(
            widget.route.name,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 36,
              height: .5,
            ),
          ),
        ),
        Text(
          widget.route.grade ?? 'Unavailable',
          style: GoogleFonts.roboto(
            fontSize: 28,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        RatingWidget(rating: widget.route.rating ?? 0),
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
          '${widget.route.length.toString()}ft',
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
        const Text(
          'Description:',
          // style: GoogleFonts.nunito(
          //   color: Colors.white,
          //   fontSize: 24,
          //   height: .5,
          // ),
        ),
        const SizedBox(height: 5),
        // Text(
        //   widget.route.description,
        //   maxLines: 4,
        //   overflow: TextOverflow.ellipsis,
        //   style: GoogleFonts.roboto(
        //     fontSize: 18,
        //     fontWeight: FontWeight.w300,
        //     color: Colors.white,
        //   ),
        // ),
        const SizedBox(height: 8)
      ],
    );
  }

  /// I used a basic plugin to get the swupe functionallity
  /// it works great, however for some reason the swiping up and down
  /// both call the up method. This method chooses which method to call
  /// up or down, based on if the final position is negative or positive
  /// in this instance, if its supposed to be up it ends up being a negative like -1300
  /// and if its supposed to be down its like positive 2000 so this should work for now
  void _handleVerticalSwipe(Offset finalPos) {
    if (finalPos.dy < 0) {
      widget.onSwipeUp?.call(finalPos);
    } else {
      widget.onSwipeDown?.call(finalPos);
    }
  }
}
