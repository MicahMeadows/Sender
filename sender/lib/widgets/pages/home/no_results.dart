import 'package:flutter/material.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/common/thick_button.dart';

class NoQueueResults extends StatelessWidget {
  final RouteQueueCubit queueCubit;
  const NoQueueResults({required this.queueCubit, Key? key}) : super(key: key);

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
            style: _appTextTheme.bodySmall?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 15),
          Text(
            'Change your filters in order to see more results.',
            style: _appTextTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          ThickButton(
            text: 'Edit Filters',
            onPressed: () {
              print('edit filter pressed...');
              // context.read<RouteQueueCubit>().loadRoutes();
              // queueCubit.loadRoutes();
            },
          )
        ],
      ),
    );
  }
}
