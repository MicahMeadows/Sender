import 'package:flutter/material.dart';

class SwipeFeedback extends StatefulWidget {
  final OverlayState? overlayState;
  const SwipeFeedback({
    required this.overlayState,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeFeedback> createState() => _SwipeFeedbackState();
}

class _SwipeFeedbackState extends State<SwipeFeedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.green,
    );
  }
}
