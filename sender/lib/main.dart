import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/repository/queue_route_repository/api_queue_route_repository.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';
import 'package:sender/widgets/pages/home/home_page.dart';

IQueueRouteRepository _queueRouteRepository = ApiQueueRouteRepository();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _queueRouteRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RouteQueueCubit(_queueRouteRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Sender',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: primaryBackground,
            scaffoldBackgroundColor: primaryBackground,
            canvasColor: primaryBackground,
            fontFamily: 'Nunito',
          ),
          routes: {
            '/': (context) => const HomePage(),
            // RouteDetailsPage.routeName: (context) => const RouteDetailsPage(),
          },
        ),
      ),
    );
  }
}
