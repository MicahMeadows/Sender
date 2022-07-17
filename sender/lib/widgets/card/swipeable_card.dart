import 'dart:io';
import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/widgets/common/breadcrumbs.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/rating_widget.dart';

import '../../data/models/climbing_route/climbing_route.dart';

enum SwipeDirection { none, left, right, up, down }

class SwipeableCard extends StatefulWidget {
  final ClimbingRoute route;
  final void Function(SwipeDirection)? onSwipe;
  final double? offsetAngle;

  const SwipeableCard({
    required this.route,
    this.offsetAngle,
    this.onSwipe,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeableCard> createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController cardAnimationController;
  late Animation recenterAnimation;
  late Animation reangleAnimation;

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
  void dispose() {
    overlayEntry?.removeListener(() {});
    overlayEntry?.remove();
    overlayEntry = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    cardAnimationController.addListener(() {
      overlayEntry?.markNeedsBuild();
    });

    cardAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        removeOverlay();
        cardAnimationController.reset();
        setState(() {
          dragOffset = loadedOrigin ?? Offset.zero;
        });
      }
    });

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
    overlayEntry?.remove();
    overlayEntry = null;
  }

  Size get _screenSize {
    return MediaQuery.of(context).size;
  }

  Offset get _screenMiddle {
    return Offset(_screenSize.width / 2, _screenSize.height / 2);
  }

  Offset get _cardMiddle {
    return _screenMiddle + dragOffset;
  }

  double get _cardRotationAngle {
    if (dragOffset == Offset.zero) {
      return 0;
    }

    bool dragAtBottom = dragStartOffset.dy > _screenSize.height / 2;

    var cardMiddlePos = _cardMiddle;

    num dX = cardMiddlePos.dx - _screenSize.width / 2;
    num dY = cardMiddlePos.dy;

    return atan2(dX, dY) * (dragAtBottom ? -1 : 1);
  }

  void animateRecenter() {
    reangleAnimation = Tween<double>(
      begin: _cardRotationAngle,
      end: 0,
    ).animate(
      cardAnimationController,
    );

    recenterAnimation =
        Tween<Offset>(begin: dragOffset, end: loadedOrigin ?? Offset.zero)
            .animate(
      cardAnimationController,
    );
    cardAnimationController.forward();
  }

  void onDragEnd(DragEndDetails details) {
    final endSwipeDirection = _currentSwipeDirection;

    if (endSwipeDirection == SwipeDirection.none) {
      animateRecenter();
    }

    widget.onSwipe?.call(endSwipeDirection);
  }

  SwipeDirection get _currentSwipeDirection {
    final cardMiddle = _cardMiddle;
    final screenSize = _screenSize;

    debugPrint('card mid y: ${cardMiddle.dy}');

    if (cardMiddle.dy < screenSize.height / 4) {
      return SwipeDirection.up;
    }
    if (cardMiddle.dx < 0) {
      return SwipeDirection.left;
    }
    if (cardMiddle.dx > screenSize.width) {
      return SwipeDirection.right;
    }
    if (cardMiddle.dy > screenSize.height - screenSize.height / 4) {
      return SwipeDirection.down;
    }
    return SwipeDirection.none;
  }

  void dragUpdate(DragUpdateDetails details) {
    dragOffset =
        (loadedOrigin ?? Offset.zero) + details.localPosition - dragStartOffset;

    debugPrint(_currentSwipeDirection.name + Random().nextDouble().toString());

    overlayEntry?.markNeedsBuild();
  }

  Offset get _calcSwipeDirections {
    final cardMiddle = _cardMiddle;
    final screenSize = _screenSize;
    const safeDistance = 150;
    int xPos = 0;
    int yPos = 0;

    if ((screenSize.width - cardMiddle.dx).abs() < safeDistance) {
      xPos = 0;
    } else if (cardMiddle.dx < screenSize.width / 2) {
      xPos = -1;
    } else if (cardMiddle.dx > screenSize.width / 2) {
      xPos = 1;
    }

    if ((screenSize.height - cardMiddle.dy).abs() < safeDistance) {
      yPos = 0;
    } else if (cardMiddle.dy < screenSize.height / 2) {
      yPos = -1;
    } else if (cardMiddle.dy > screenSize.height / 2) {
      yPos = 1;
    }

    return Offset(xPos.toDouble(), yPos.toDouble());
  }

  Map<String, Object> get _gradientSettings {
    var dirs = _calcSwipeDirections;
    return {
      "start": () {
        if (dirs.dx == -1) {
          if (dirs.dy == 1) return Alignment.topLeft;
          return Alignment.bottomLeft;
        }
        if (dirs.dx == 1) {
          if (dirs.dy == 1) return Alignment.topRight;
          return Alignment.bottomRight;
        }
        return Alignment.topCenter;
      }(),
      "end": () {
        if (dirs.dx == -1) {
          if (dirs.dy == 1) return Alignment.bottomRight;
          return Alignment.topRight;
        }
        if (dirs.dx == 1) {
          if (dirs.dy == 1) return Alignment.bottomLeft;
          return Alignment.topLeft;
        }
        return Alignment.bottomCenter;
      }(),
      "colors": () {
        if (dirs.dx == -1) {
          return [
            Colors.red,
            Colors.red,
          ];
        }
        if (dirs.dx == 1) {
          return [
            Colors.blue,
            Colors.blue,
          ];
        }
        if (dirs.dx == 0 && dirs.dy == 1) {
          return [
            Colors.green,
            Colors.green,
          ];
        }
        return [
          Colors.white.withOpacity(.45),
          Colors.white.withOpacity(.45),
        ];
      }()
    };
  }

  void createOverlayEntry() {
    debugPrint(loadedOrigin?.dx.toString());
    overlayEntry = OverlayEntry(builder: (ctx) {
      double dX = dragOffset.dx;
      double dY = dragOffset.dy;
      double a = _cardRotationAngle;

      if (cardAnimationController.isAnimating) {
        Offset currentRecenterPos = recenterAnimation.value as Offset;
        dX = currentRecenterPos.dx;
        dY = currentRecenterPos.dy;

        double currentReangleAngle = reangleAnimation.value as double;
        a = currentReangleAngle;
      }
      return Positioned(
        width: loadedSize != null ? loadedSize!.width : null,
        height: loadedSize != null ? loadedSize!.height : null,
        left: dX,
        top: dY,
        child: Transform.rotate(
          angle: a,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 320),
            child: buildCardWidget(ctx),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              gradient: LinearGradient(
                colors: _gradientSettings["colors"] as List<Color>,
                begin: _gradientSettings["start"] as Alignment,
                end: _gradientSettings["end"] as Alignment,
                // colors: [
                //   Colors.white.withOpacity(.45),
                //   Colors.white.withOpacity(.45)
                // ],
                // begin: Alignment.centerLeft,
                // end: Alignment.topRight,
              ),
            ),
          ),
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

  Widget buildCardWidget(BuildContext bContext) {
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
        onVerticalDragEnd: onDragEnd,
        onHorizontalDragEnd: onDragEnd,
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
}
