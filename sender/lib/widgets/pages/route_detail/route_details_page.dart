import 'dart:math';

import 'package:flutter/gestures.dart';
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
  final GlobalKey _imageKey = GlobalKey();

  // double lastDistanceFromHeader = 0;
  double _lastAboveAppBarDistanceFromTop = 0;
  double _lastBelowAppBarDistanceFromTop = 0;
  double _lastImageHeight = 0;

  double get _statusHeight {
    return MediaQuery.of(context).viewPadding.top;
  }

  double get _lastDistanceFromHeader {
    return max(0, min(_lastAboveAppBarDistanceFromTop, _statusHeight));
  }

  final ScrollController _scrollController = ScrollController();
  bool _initialized = false;
  late final Image image;
  @override
  void initState() {
    image = Image.network(
      widget.route.imageUrls.first,
      fit: BoxFit.cover,
    );

    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      RenderBox aboveAppBarRenderObj =
          _aboveAppBarKey.currentContext?.findRenderObject() as RenderBox;
      RenderBox belowAppBarRenderObj =
          _belowAppBarKey.currentContext?.findRenderObject() as RenderBox;
      RenderBox? imageRenderBox =
          _imageKey.currentContext?.findRenderObject() as RenderBox?;

      _lastAboveAppBarDistanceFromTop =
          aboveAppBarRenderObj.localToGlobal(Offset.zero).dy;

      _lastBelowAppBarDistanceFromTop =
          belowAppBarRenderObj.localToGlobal(Offset.zero).dy;

      _lastImageHeight = imageRenderBox?.size.height ?? 0;

      // print('dist to top: $_lastDistanceFromTop');
      // print('dist: $_lastDistanceFromHeader');
      // print('status height: ${_statusHeight}');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // image,
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
                  child: SizedBox(height: 700),
                ),
                // SliverOpacity(
                //   opacity: 0,
                //   sliver: SliverToBoxAdapter(
                //     child: image,
                //   ),
                // ),
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
                    var heightSize = MediaQuery.of(context).viewPadding.top -
                        _lastDistanceFromHeader;
                    if (!_initialized) {
                      heightSize = 0;
                    }
                    _initialized = true;
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
                // SliverToBoxAdapter(
                //   child: Container(
                //     height: 800,
                //     color: Colors.red,
                //   ),
                // )
              ],
            ),
          ),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       // Container(
          //       //   height: MediaQuery.of(context).size.height * .6,
          //       // ),
          //       Container(
          //         height: MediaQuery.of(context).size.height * .6,
          //       ),
          //       Container(
          //         height: 1300,
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.vertical(
          //             top: Radius.circular(35),
          //           ),
          //         ),
          //         child: Column(children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Spacer(),
          //               Expanded(child: Text(route.name)),
          //               IconButton(
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //                 icon: Icon(Icons.close),
          //               )
          //             ],
          //           )
          //         ]),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
