import 'dart:math';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/common/breadcrumbs.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/pages/route_detail/custom_details_list.dart';

import '../../../data/models/climbing_route/climbing_route.dart';

class BottomOption {
  final String buttonText;
  final void Function() onPress;

  const BottomOption({
    required this.buttonText,
    required this.onPress,
  });
}

class RouteDetailsPage extends StatefulWidget {
  static const String routeName = '/route-details';
  final List<BottomOption> bottomOptions;

  final ClimbingRoute route;
  const RouteDetailsPage({
    required this.route,
    this.bottomOptions = const [],
    Key? key,
  }) : super(key: key);

  @override
  State<RouteDetailsPage> createState() => _RouteDetailsPageState();
}

class _RouteDetailsPageState extends State<RouteDetailsPage>
    with TickerProviderStateMixin {
  final GlobalKey _aboveAppBarKey = GlobalKey();
  final GlobalKey _belowAppBarKey = GlobalKey();
  late final AnimationController _headerAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );
  late final Animation _headerAnimation;

  int _selectedImageIdx = 0;

  static const double _sidePadding = 12.0;

  late final _initialImageSectionHeight =
      MediaQuery.of(context).size.height * .5;
  double _lastAboveAppBarDistanceFromTop = 0;
  double _lastBelowAppBarDistanceFromTop = 0;

  Offset? startDragPos;
  double initalScrollPos = 0;

  final _scrollController = ScrollController();
  final _imageController = PageController(initialPage: 0);
  bool _initialized = false;

  late List<Image> images;

  @override
  void initState() {
    _headerAnimation = Tween<double>(begin: 1, end: 0).animate(
      _headerAnimationController,
    );
    var firstRender = true;
    _scrollController.addListener(() {
      if (firstRender) {
        firstRender = false;
        return;
      }
      final double height = MediaQuery.of(context).size.height;
      if (_lastBelowAppBarDistanceFromTop >= height * .98) {
        _headerAnimationController.forward();
      } else {
        _headerAnimationController.reverse();
      }
    });
    images = (widget.route.imageUrls ?? []).map((imageUrl) {
      return Image.network(
        imageUrl,
        fit: BoxFit.fitWidth,
      );
    }).toList();

    _scrollController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var element in images) {
      precacheImage(element.image, context);
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Completer<ui.Image> completer = Completer<ui.Image>();
    images[_selectedImageIdx]
        .image
        .resolve(const ImageConfiguration())
        .addListener(
      ImageStreamListener(
        (ImageInfo image, bool _) {
          completer.complete(image.image);
          setState(() {});
        },
      ),
    );

    return FutureBuilder(
      future: completer.future,
      builder: (context, AsyncSnapshot<ui.Image> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            // color: Colors.white,
            color: col.primary,
            child: const Center(
              child: KnotProgressIndicator(color: Colors.white),
            ),
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            RenderBox aboveAppBarRenderObj =
                _aboveAppBarKey.currentContext?.findRenderObject() as RenderBox;
            RenderBox belowAppBarRenderObj =
                _belowAppBarKey.currentContext?.findRenderObject() as RenderBox;

            _lastAboveAppBarDistanceFromTop =
                aboveAppBarRenderObj.localToGlobal(Offset.zero).dy;

            _lastBelowAppBarDistanceFromTop =
                belowAppBarRenderObj.localToGlobal(Offset.zero).dy;

            if (!_initialized) {
              setState(() {
                _scrollController.jumpTo(_initialImageSectionHeight);
              });
            }
            setState(() {});

            _initialized = true;
          });
          return Scaffold(
            backgroundColor: col.primary,
            body: Stack(
              children: [
                Positioned(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  child: images[_selectedImageIdx],
                ),
                Positioned(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    child: Stack(
                      children: [
                        PageView(
                          onPageChanged: (idx) {
                            setState(() {
                              _selectedImageIdx = idx;
                              initalScrollPos =
                                  _imageController.page!.roundToDouble() *
                                      MediaQuery.of(context).size.width;
                              startDragPos = null;
                            });
                          },
                          children: images,
                          controller: _imageController,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: _lastBelowAppBarDistanceFromTop -
                              _lastAboveAppBarDistanceFromTop +
                              5,
                          child: Breadcrumbs(
                            itemCount: images.length,
                            index: _selectedImageIdx,
                          ),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: max(0, _lastBelowAppBarDistanceFromTop),
                  ),
                  right: 0,
                  left: 0,
                  top: 0,
                ),
                Positioned.fill(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height -
                              (_lastBelowAppBarDistanceFromTop -
                                  _lastAboveAppBarDistanceFromTop) -
                              15,
                          child: GestureDetector(
                            onTapDown: (details) {
                              if ((widget.route.imageUrls?.length ?? 0) < 2) {
                                return;
                              }

                              var tapPosX = details.globalPosition.dx;
                              const buttonScaler = .3;
                              const pageFlipDuration = Duration(
                                milliseconds: 200,
                              );
                              const pageFlipCurve =
                                  Curves.fastLinearToSlowEaseIn;
                              final screenWidth =
                                  MediaQuery.of(context).size.width;
                              final buttonSize = screenWidth * buttonScaler;

                              if (tapPosX < buttonSize) {
                                _imageController.previousPage(
                                  duration: pageFlipDuration,
                                  curve: pageFlipCurve,
                                );
                              } else if (tapPosX > screenWidth - buttonSize) {
                                _imageController.nextPage(
                                  duration: pageFlipDuration,
                                  curve: pageFlipCurve,
                                );
                              }
                            },
                            onHorizontalDragStart: (details) {
                              startDragPos = details.localPosition;
                            },
                            onHorizontalDragUpdate: (details) {
                              if (startDragPos != null) {
                                var dragChangeX =
                                    startDragPos!.dx - details.localPosition.dx;

                                _imageController
                                    .jumpTo(initalScrollPos + dragChangeX);
                              }
                            },
                            onHorizontalDragEnd: (details) {
                              initalScrollPos =
                                  _imageController.page!.roundToDouble() *
                                      MediaQuery.of(context).size.width;
                              startDragPos = null;
                            },
                            onHorizontalDragCancel: () {
                              initalScrollPos =
                                  _imageController.page!.roundToDouble() *
                                      MediaQuery.of(context).size.width;
                              startDragPos = null;
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 0,
                          key: _aboveAppBarKey,
                        ),
                      ),
                      SliverAppBar(
                        backgroundColor: col.primary.withOpacity(
                          _headerAnimation.value,
                        ),
                        toolbarHeight: 0,
                        elevation: 2,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(35),
                          ),
                        ),
                        snap: true,
                        floating: true,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(flex: 1),
                              Expanded(
                                flex: 4,
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    widget.route.name,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                      color: col.text1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  // ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.close_rounded,
                                    color: col.text1,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 0,
                          key: _belowAppBarKey,
                        ),
                      ),
                      CustomDetailsList(
                        animValue: _headerAnimation.value,
                        bottomOptions: widget.bottomOptions,
                        route: widget.route,
                        sidePadding: _sidePadding,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
