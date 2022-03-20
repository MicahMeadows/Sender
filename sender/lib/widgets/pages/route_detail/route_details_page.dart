import 'dart:math';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sender/data/models/climbing_route.dart';

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

  int _selectedImageIdx = 1;

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
      var scrollPos = _scrollController.position;
      print('scroll pos: $scrollPos');
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
            print('last above dist: $_lastAboveAppBarDistanceFromTop');

            _lastBelowAppBarDistanceFromTop =
                belowAppBarRenderObj.localToGlobal(Offset.zero).dy;
            print('last below dist: $_lastBelowAppBarDistanceFromTop');

            if (!_initialized) {
              _scrollController
                  .jumpTo(MediaQuery.of(context).size.height * .55);
            }

            _initialized = true;
          });
          var imgHeight = snapshot.data!.height;
          print('img height: $imgHeight');
          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height,
                    child: image),
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
                  // child: Container(
                  //   child: image,
                  //   height: 250,
                  // ),
                  child: Container(
                    child: image,
                    height: max(0, _lastBelowAppBarDistanceFromTop),
                  ),
                  right: 0,
                  left: 0,
                  top: 0,
                  // top: -(.5 * (image.height ?? 0)),
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
                        elevation: 0,
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
                          centerTitle: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              Expanded(child: Text(widget.route.name)),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.close),
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
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              color: index.isOdd ? Colors.white : Colors.green,
                              height: 100.0,
                              child: Center(
                                child: Text('$index', textScaleFactor: 5),
                              ),
                            );
                          },
                          childCount: 20,
                        ),
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
