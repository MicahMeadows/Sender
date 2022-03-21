import 'dart:math';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/models/climbing_route.dart';
import 'package:sender/widgets/rating_widget.dart';

class RouteDetailsPage extends StatefulWidget {
  static const String routeName = '/route-details';

  final ClimbingRoute route;
  const RouteDetailsPage({required this.route, Key? key}) : super(key: key);

  @override
  State<RouteDetailsPage> createState() => _RouteDetailsPageState();
}

class _RouteDetailsPageState extends State<RouteDetailsPage> {
  final GlobalKey _aboveAppBarKey = GlobalKey();
  final GlobalKey _belowAppBarKey = GlobalKey();
  late final _appTextTheme = Theme.of(context).textTheme;

  int _selectedImageIdx = 0;

  // double lastDistanceFromHeader = 0;
  double _lastAboveAppBarDistanceFromTop = 0;
  double _lastBelowAppBarDistanceFromTop = 0;

  double get _statusHeight {
    return MediaQuery.of(context).viewPadding.top;
  }

  double get _lastDistanceFromHeader {
    return max(0, min(_lastAboveAppBarDistanceFromTop, _statusHeight));
  }

  final ScrollController _scrollController = ScrollController();
  bool _initialized = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Image image = Image.network(
      widget.route.imageUrls[_selectedImageIdx],
      fit: BoxFit.fitWidth,
    );

    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
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
          return CircularProgressIndicator();
        } else {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
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
              _scrollController
                  .jumpTo(MediaQuery.of(context).size.height * .55);
            }

            _initialized = true;
          });
          var imgHeight = snapshot.data!.height;
          // print('img height: $imgHeight');
          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  child: image,
                ),
                Positioned(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.white.withOpacity(.05),
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    child: image,
                    width: double.infinity,
                    height: max(0, _lastBelowAppBarDistanceFromTop),
                  ),
                  right: 0,
                  left: 0,
                  top: 0,
                ),
                Positioned.fill(
                  // top: -_statusHeight,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height -
                              (_lastBelowAppBarDistanceFromTop -
                                  _lastAboveAppBarDistanceFromTop),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 0,
                          key: _aboveAppBarKey,
                        ),
                      ),
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(35),
                          ),
                        ),
                        snap: false,
                        floating: true,
                        toolbarHeight: () {
                          var heightSize =
                              MediaQuery.of(context).viewPadding.top -
                                  _lastDistanceFromHeader;
                          if (!_initialized) {
                            heightSize = 0;
                          }
                          return heightSize;
                        }(),
                        flexibleSpace: FlexibleSpaceBar(
                          titlePadding: EdgeInsets.zero,
                          centerTitle: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(flex: 1),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  widget.route.name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
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
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 10,
                          color: Colors.white,
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
      color: Colors.white,
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
              style: _appTextTheme.bodyText1,
            ),
          ),
          RatingWidget(
            rating: widget.route.rating,
            height: 25,
            color: primaryColor,
          ),
          const SizedBox(height: 5),
          _buildDetailHeader('Details'),
          _buildLabledCard('Type:', widget.route.type),
          _buildLabledCard('Height:', widget.route.height.toString()),
          _buildLabledCard('Protection:', widget.route.protection),
          _buildLabledCard('Grade:', widget.route.grade),
          _buildLabledCard('First Ascent:', widget.route.firstAscent),
          const SizedBox(height: 23),
          _buildDetailHeader('Area'),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              children: [
                for (var area in widget.route.areas) _buildTextCard(area.name),
              ],
            ),
          ),
          const SizedBox(height: 23),
          _buildDetailHeader('Location'),
          _buildTextCard(widget.route.location),
          const SizedBox(height: 30),
          _buildBlueButton('Add to Send Stack', () {}),
          const SizedBox(height: 3),
          _buildBlueButton('Add to Todo List', () {}),
        ],
      ),
    );
  }

  Widget _buildDetailHeader(String text) {
    return Container(
      width: double.infinity,
      color: const Color(0xfff4f4f4),
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          text,
          style: _appTextTheme.bodyText1,
        ),
      ),
    );
  }

  Widget _buildLabledCard(String title, String content) {
    return _buildDetailCard(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: _appTextTheme.bodyText1,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            content,
            style: _appTextTheme.bodyText1,
            textAlign: ui.TextAlign.end,
          ),
        ),
      ],
    ));
  }

  Widget _buildTextCard(String text) {
    return _buildDetailCard(
      Text(
        text,
        style: _appTextTheme.bodyText1,
      ),
    );
  }

  Widget _buildDetailCard(Widget child) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        child: child,
      ),
    );
  }

  Widget _buildBlueButton(String text, void Function() onPress) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(primaryColor),
        foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
      ),
      onPressed: () {},
      child: Text(
        'Add to Send Stack',
        style: GoogleFonts.nunito(fontSize: 18),
      ),
    );
  }
}
