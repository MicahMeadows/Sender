import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/card/card_vote.dart';
import 'package:sender/widgets/pages/home/no_results.dart';
import 'package:sender/widgets/pages/home/queue_error.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteQueueCubit, RouteQueueState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).viewPadding.top,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0,
                  color: Colors.white,
                ),
              ),
              height: 5,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Image.asset(
                'assets/images/sender_header_logo.png',
                height: 40,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: _buildMainContent(state),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMainContent(RouteQueueState state) {
    if (state is RouteQueueLoading) {
      return const KnotProgressIndicator();
    }
    if (state is RouteQueueLoaded) {
      return CardVote(
        queueCubit: context.read<RouteQueueCubit>(),
        key: UniqueKey(),
        routes: state.routes,
        onRoutesChanged: (routes) {
          setState(() {});
        },
      );
    }
    if (state is RouteQueueEmpty) {
      return NoQueueResults(
        queueCubit: context.read<RouteQueueCubit>(),
      );
    }
    return const QueueError();
  }
}
