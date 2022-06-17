import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class KnotProgressIndicator extends StatefulWidget {
  final Color color;
  final Size size;
  const KnotProgressIndicator({
    this.size = const Size(40, 40),
    this.color = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  State<KnotProgressIndicator> createState() => _KnotProgressIndicatorState();
}

class _KnotProgressIndicatorState extends State<KnotProgressIndicator> {
  late SimpleAnimation _controller;

  @override
  void initState() {
    _controller = SimpleAnimation('Loading');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var riveAsset = RiveAnimation.asset(
      'assets/rive/FigureEightIcon.riv',
      controllers: [_controller],
      onInit: (artboard) => artboard.forEachComponent((component) {
        if (component is Shape) {
          (component.strokes.first.children[0] as SolidColor).colorValue =
              widget.color.value;
        }
      }),
    );

    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: riveAsset,
    );
  }
}
