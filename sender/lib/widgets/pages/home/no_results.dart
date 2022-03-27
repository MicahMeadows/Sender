import 'package:flutter/material.dart';
import 'package:sender/widgets/common/thick_button.dart';

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
          ThickButton(
            text: 'Edit Filters',
            onPressed: () {
              print('edit filter pressed...');
            },
          )
        ],
      ),
    );
  }
}
