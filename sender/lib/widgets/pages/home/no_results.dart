import 'package:flutter/material.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/common/thick_button.dart';
import 'package:sender/common/constants/colors.dart' as col;

class NoQueueResults extends StatelessWidget {
  final RouteQueueCubit queueCubit;
  const NoQueueResults({required this.queueCubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTextTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(color: Colors.white.withOpacity(.25), blurRadius: 60),
              ],
            ),
            child: Center(
              child: SizedBox(
                // child: Image.asset('assets/images/anchor_image.png'),
                child: Image.asset('assets/images/anchor.png'),
                width: 80,
              ),
            ),
          ),
          Spacer(flex: 1),
          Text(
            'No routes to be shown!',
            textAlign: TextAlign.center,
            style: _appTextTheme.titleMedium?.copyWith(color: col.text1),
          ),
          const SizedBox(height: 15),
          Text(
            'Change your filters in order to see more results.',
            style: _appTextTheme.bodySmall?.copyWith(color: col.text2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          ThickButton(
            text: 'Edit Filters',
            onPressed: () {
              debugPrint('edit filter pressed...');
            },
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
