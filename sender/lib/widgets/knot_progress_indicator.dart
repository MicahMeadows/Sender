import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class KnotProgressIndicator extends StatefulWidget {
  final Size size;
  const KnotProgressIndicator({
    this.size = const Size(40, 40),
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
    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: RiveAnimation.asset(
        'assets/FigureEightIcon.riv',
        controllers: [_controller],
        onInit: (_) => setState(() {}),
      ),
    );
  }
}
