import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart';

class NoQueueResults extends StatelessWidget {
  const NoQueueResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 95),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('assets/images/anchor_image.png'),
            width: 85,
          ),
          const SizedBox(height: 25),
          Text(
            'No results to be shown!',
            textAlign: TextAlign.center,
            style: _appTextTheme.bodyText1?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 15),
          Text(
            'Change your filters in order to see more results.',
            style: _appTextTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          Container(
            height: 48,
            width: 170,
            child: Center(
              child: Text(
                'Edit Filters',
                style: _appTextTheme.bodyText1,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: primaryColor,
                  blurRadius: 0,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
