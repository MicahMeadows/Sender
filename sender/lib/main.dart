import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/route_settings/route_settings_cubit.dart';
import 'package:sender/data/cubits/navigation/navigation_cubit.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/repository/queue_route_repository/api_queue_route_repository.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/firebase_options.dart';
import 'package:sender/widgets/auth_gate.dart';
import 'package:sender/widgets/pages/settings/settings_page.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
IQueueRouteRepository _queueRouteRepository = ApiQueueRouteRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          BlocProvider(create: (_) => RouteQueueCubit(_queueRouteRepository)),
          BlocProvider(create: (_) => NavigationCubit()),
          BlocProvider(create: (_) => RouteSettingsCubit()),
          BlocProvider(
            create: (_) => FirebaseAuthCubit(_firebaseAuth),
            lazy: false,
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            title: 'Sender',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              backgroundColor: primaryColor,
              scaffoldBackgroundColor: primaryColor,
              canvasColor: primaryColor,
              fontFamily: 'Nunito',
              textTheme: TextTheme(
                bodySmall: GoogleFonts.nunito(fontSize: 16),
                bodyMedium: GoogleFonts.nunito(fontSize: 18),
                titleMedium: GoogleFonts.nunito(fontSize: 24),
              ),
            ),
            initialRoute: '/',
            home: const AuthGate(),
            routes: {
              SettingsPageContent.routeName: (context) => SettingsPageContent(),
            },
          );
        }),
      ),
    );
  }
}
