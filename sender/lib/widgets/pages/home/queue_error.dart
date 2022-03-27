import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart';

class QueueError extends StatelessWidget {
  const QueueError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 95),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('assets/images/atc_image.png'),
            width: 115,
          ),
          const SizedBox(height: 25),
          Text(
            'Something went wrong!',
            textAlign: TextAlign.center,
            style: _appTextTheme.bodyText1?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 35),
          Container(
            height: 48,
            width: 170,
            child: Center(
              child: Text(
                'Reload',
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
