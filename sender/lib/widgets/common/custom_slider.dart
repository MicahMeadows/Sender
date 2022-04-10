import 'package:flutter/material.dart';
import 'dart:core';

class CustomSlider extends StatefulWidget {
  final double pointerPadding;
  final int numHandles;
  final double handleRadius;
  final List<double> values;
  final List<Color> colors;
  final Color trackColor;

  const CustomSlider({
    required this.numHandles,
    required this.colors,
    required this.values,
    this.pointerPadding = 15,
    this.handleRadius = 10,
    this.trackColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late var handleValues = [...widget.values];

  int getClosestSliderIdx(double pointerVal) {
    List<Map<String, dynamic>> map = [];
    for (int i = 0; i < handleValues.length; i++) {
      var toAdd = {
        "idx": i,
        "val": (pointerVal - handleValues[i]).abs(),
      };
      map.add(toAdd);
    }
    map.sort((a, b) => (a["val"] as double).compareTo(b["val"] as double));

    return map[0]["idx"] as int;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sliderSize = constraints.biggest;
        return Listener(
          onPointerMove: (details) {
            var pointerValue = details.localPosition.dx / sliderSize.width;
            int closestSliderIdx = getClosestSliderIdx(pointerValue);

            var valueDifBetweenClosestHandleAndPointer =
                (pointerValue - handleValues[closestSliderIdx]).abs();

            var pixelDistanceBetweenPointerAndHandle =
                (sliderSize.width * valueDifBetweenClosestHandleAndPointer)
                    .abs();

            var maxAcceptedRange = widget.handleRadius + widget.pointerPadding;
            var canSlide =
                pixelDistanceBetweenPointerAndHandle <= maxAcceptedRange;
            if (canSlide) {
              setState(() {
                if (pointerValue < 0) pointerValue = 0;
                if (pointerValue > 1) pointerValue = 1;
                handleValues[closestSliderIdx] = pointerValue;
              });
            }
          },
          child: Container(
            width: 450,
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.handleRadius,
                  ),
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                  ),
                ),
                for (int i = 0; i < widget.numHandles; i++)
                  Positioned(
                    left: (sliderSize.width * handleValues[i]) -
                        widget.handleRadius,
                    child: Container(
                      height: widget.handleRadius * 2,
                      width: widget.handleRadius * 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3, color: widget.colors[i]),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(.25),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
