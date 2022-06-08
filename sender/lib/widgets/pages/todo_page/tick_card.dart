import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/widgets/common/rating_widget.dart';

class TickCard extends StatelessWidget {
  final RouteTick tick;
  const TickCard({
    required this.tick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          color: col.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 4,
              color: Colors.black.withOpacity(.25),
            ),
          ]),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                tick.name,
                style: const TextStyle(
                  color: col.text1,
                  fontSize: 18,
                ),
              )),
              Text(
                tick.grade,
                style: const TextStyle(
                  fontSize: 16,
                  color: col.text1,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  tick.area,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    color: col.text2,
                  ),
                ),
              ),
              RatingWidget(
                rating: tick.rating,
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
