import 'package:flutter/material.dart';

class FadingWidget extends StatefulWidget {
  final Widget child;
  final void Function() onComplete;
  final void Function() onUpdate;
  final Curve animationCurve;
  final Duration animationDuration;

  const FadingWidget({
    required this.animationCurve,
    required this.child,
    required this.onUpdate,
    required this.onComplete,
    required this.animationDuration,
    Key? key,
  }) : super(key: key);

  @override
  State<FadingWidget> createState() => _FadingWidgetState();
}

class _FadingWidgetState extends State<FadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _fadeAnimation;

  @override
  void initState() {
    debugPrint('init');
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _fadeAnimation = CurvedAnimation(
      curve: widget.animationCurve,
      parent: _animationController,
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
      }
    });

    _animationController.addListener(() {
      widget.onUpdate();
    });

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double flipped = 1.0 - _fadeAnimation.value;

    return Transform.scale(
      scale: flipped / 2,
      child: Opacity(
        // opacity: 1.0 - _fadeAnimation.value,
        opacity: flipped,
        child: widget.child,
      ),
    );
  }
}
