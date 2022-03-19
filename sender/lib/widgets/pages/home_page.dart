import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/custom_tab_bar.dart';
import 'package:sender/widgets/card_vote.dart';
import 'package:sender/widgets/knot_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteQueueCubit, RouteQueueState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primaryBackground,
          body: Column(
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
                child: Container(
                  child: Stack(
                    children: [
                      Center(
                        child: _buildMainContent(state),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomTabBar(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMainContent(RouteQueueState state) {
    if (state is RouteQueueLoading) {
      return const KnotProgressIndicator();
    }
    if (state is RouteQueueLoaded) {
      return CardVote(routes: state.routes);
    }
    if (state is RouteQueueEmpty) {
      return const Text('There were no routes to be loaded.');
    }
    return const Text('Error loading routes');
  }
}
