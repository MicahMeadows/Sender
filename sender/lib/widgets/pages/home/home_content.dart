import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/navigation/navigation_cubit.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
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
        return SafeArea(
          child: Column(
            children: [
              // Container(
              //   // color: Colors.white,
              //   height: MediaQuery.of(context).viewPadding.top,
              //   width: double.infinity,
              // ),
              const SizedBox(height: 10),
              SizedBox(
                // color: Colors.white,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/sender_header_logo.png',
                  height: 50,
                ),
              ),
              Expanded(
                child: _buildMainContent(state),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMainContent(RouteQueueState state) {
    if (state is RouteQueueLoading) {
      return const KnotProgressIndicator(
        color: Colors.white,
      );
    }
    if (state is RouteQueueLoaded) {
      return CardVote(
        queueCubit: context.read<RouteQueueCubit>(),
        todoCubit: context.read<TodoListCubit>(),
        key: UniqueKey(),
        routes: state.routes,
        onRoutesChanged: (routes) {
          setState(() {});
        },
      );
    }
    if (state is RouteQueueEmpty) {
      return NoQueueResults(
        navigationCubit: context.read<NavigationCubit>(),
        queueCubit: context.read<RouteQueueCubit>(),
      );
    }
    return const QueueError();
  }
}
