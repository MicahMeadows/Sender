import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/common/thick_button.dart';

import '../../common/shadow_image.dart';

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
          ShadowImage(
            child: SizedBox(
              width: 115,
              child: Image.asset('assets/images/atc_image.png'),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Something went wrong!',
            textAlign: TextAlign.center,
            style: _appTextTheme.bodySmall
                ?.copyWith(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 35),
          ThickButton(
            text: 'Reload',
            onPressed: () {
              context.read<RouteQueueCubit>().loadRoutes(count: 1);
            },
          )
        ],
      ),
    );
  }
}
