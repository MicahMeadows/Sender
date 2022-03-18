import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/constants/colors.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/widgets/custom_tab_bar.dart';
import 'package:sender/widgets/card_vote.dart';
import 'package:google_fonts/google_fonts.dart';

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<RouteQueueCubit>().loadRoutes();
            },
          ),
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            title: Text(
              "Sender",
              style: GoogleFonts.nunito(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: primaryBackground,
          body: Column(
            children: [
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
      return const Text('loading...');
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
