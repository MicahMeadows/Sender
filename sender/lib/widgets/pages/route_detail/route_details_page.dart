import 'dart:math';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/common/base_card.dart';
import 'package:sender/widgets/common/breadcrumbs.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/labled_card.dart';
import 'package:sender/widgets/common/rating_widget.dart';
import 'package:sender/widgets/common/section_banner.dart';
import 'package:sender/widgets/common/thick_button.dart';

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

class _RouteDetailsPageState extends State<RouteDetailsPage> {
  final GlobalKey _aboveAppBarKey = GlobalKey();
  final GlobalKey _belowAppBarKey = GlobalKey();
  late final _appTextTheme = Theme.of(context).textTheme;

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
    images = widget.route.imageUrls.map((imageUrl) {
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
      // image.image.resolve(const ImageConfiguration()).addListener(
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
              child: KnotProgressIndicator(),
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
            // print('last above dist: $_lastAboveAppBarDistanceFromTop');

            _lastBelowAppBarDistanceFromTop =
                belowAppBarRenderObj.localToGlobal(Offset.zero).dy;
            // print('last below dist: $_lastBelowAppBarDistanceFromTop');

            if (!_initialized) {
              // _scrollController
              //     .jumpTo(MediaQuery.of(context).size.height * .55);
              setState(() {
                _scrollController.jumpTo(_initialImageSectionHeight);
              });
            }
            setState(() {});

            _initialized = true;
          });
          // print('img height: $imgHeight');
          return Scaffold(
            // backgroundColor: Colors.white,
            backgroundColor: col.primary,
            // extendBodyBehindAppBar: false,
            body: Stack(
              // clipBehavior: Clip.none,
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
                                  _lastAboveAppBarDistanceFromTop),
                          child: GestureDetector(
                            onTapDown: (details) {
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
                          // child: Container(
                          //   child: images[_selectedImageIdx],
                          //   height: max(0, _lastBelowAppBarDistanceFromTop),
                          // ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 0,
                          key: _aboveAppBarKey,
                        ),
                      ),
                      SliverAppBar(
                        backgroundColor: col.primary,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    widget.route.name,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                      // color: Colors.black,
                                      color: col.text1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
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
                      SliverToBoxAdapter(
                        child: _buildRouteDetailsWidget(context),
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

  Widget _buildRouteDetailsWidget(BuildContext context) {
    return Container(
      // color: Colors.white,
      color: col.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              widget.route.description,
              // style: GoogleFonts.nunito(
              //   fontSize: 16,
              // ),
              style: _appTextTheme.bodySmall?.copyWith(color: col.text1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingWidget(
              rating: widget.route.rating,
              height: 25,
              color: col.accent,
            ),
          ),
          const SizedBox(height: 5),
          const SectionBanner(text: 'Details'),
          const SizedBox(height: 3),

          _buildLabledCard('Type:', widget.route.type),
          _buildLabledCard('Height:', '${widget.route.height.toString()}ft'),
          _buildLabledCard('Protection:', widget.route.protection),
          _buildLabledCard('Grade:', widget.route.grade),
          _buildLabledCard('First Ascent:', widget.route.firstAscent),
          const SizedBox(height: 23),
          const SectionBanner(text: 'Area'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var area in widget.route.areas)
                    _buildTextCard(area.name),
                ],
              ),
            ),
          ),
          const SizedBox(height: 23),
          const SectionBanner(text: 'Location'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
            child:
                _buildTextCard(widget.route.location, width: double.infinity),
          ),
          const SizedBox(height: 30),
          // _buildBlueButton('Add to Send Stack', () {
          //   setState(() {
          //     // _selectedImageIdx--;
          //   });
          // }),
          // ThickButton(
          //   text: 'Add to Send Stack',
          //   onPressed: () {},
          //   width: 200,
          // ),
          // const SizedBox(height: 20),
          // ThickButton(
          //   text: 'Remove from Todo List',
          //   onPressed: () {},
          //   width: 200,
          // ),
          for (var option in widget.bottomOptions)
            ThickButton(text: option.buttonText, onPressed: option.onPress),
          const SizedBox(height: 50),
          // _buildBlueButton('Add to Todo List', () {
          //   setState(() {
          //     // _selectedImageIdx++;
          //   });
          // }),
        ],
      ),
    );
  }

  Widget _buildLabledCard(String title, String content) {
    return LabledCard.text(
      title: title,
      content: content,
      style: _appTextTheme.bodySmall?.apply(color: col.text1),
    );
    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: _sidePadding, vertical: 5),
    //   child: BaseCard(
    //       child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(
    //         title,
    //         style: _appTextTheme.bodySmall?.apply(color: col.text1),
    //       ),
    //       const SizedBox(width: 15),
    //       Expanded(
    //         child: Text(
    //           content,
    //           style: _appTextTheme.bodySmall?.apply(color: col.text1),
    //           textAlign: ui.TextAlign.end,
    //         ),
    //       ),
    //     ],
    //   )),
    // );
  }

  Widget _buildTextCard(String text, {double? width}) {
    return BaseCard(
      width: width,
      child: Text(
        text,
        style: _appTextTheme.bodySmall?.apply(color: col.text1),
      ),
    );
  }

  // Widget _buildBlueButton(String text, void Function() onPress) {
  //   return TextButton(
  //     style: ButtonStyle(
  //       backgroundColor: MaterialStateProperty.all<Color?>(col.tertiary),
  //       foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
  //     ),
  //     onPressed: onPress,
  //     child: Text(
  //       text,
  //       style: GoogleFonts.nunito(fontSize: 18),
  //     ),
  //   );
  // }
}
