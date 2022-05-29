import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/navigation/navigation_cubit.dart';
import 'package:sender/data/cubits/route_preferences/route_settings_cubit.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/repository/queue_route_repository/api_queue_route_repository.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/data/repository/user_repository/api_user_repository.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';
import 'package:sender/firebase_options.dart';
import 'package:sender/widgets/auth_gate.dart';
import 'common/networking/header_authenticated_api.dart';
import 'common/networking/i_rest_api.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

IRestApi _senderApi = HeaderAuthenticatedApi(
  baseUrl: 'http://10.0.2.2:8080/',
  getAuthToken: () => _firebaseAuth.currentUser?.getIdToken(),
);

IQueueRouteRepository _queueRouteRepository =
    ApiQueueRouteRepository(_senderApi);
IUserRepository _userRepository = ApiUserRepository(_senderApi);

RouteQueueCubit routeQueueCubit = RouteQueueCubit(_queueRouteRepository);
NavigationCubit navigationCubit = NavigationCubit();
RouteSettingsCubit routeSettingsCubit =
    RouteSettingsCubit(userRepository: _userRepository);
FirebaseAuthCubit firebaseAuthCubit = FirebaseAuthCubit(_firebaseAuth);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => _queueRouteRepository),
        RepositoryProvider(create: (_) => _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => routeQueueCubit),
          BlocProvider(create: (_) => navigationCubit),
          BlocProvider(create: (_) => routeSettingsCubit),
          BlocProvider(create: (_) => firebaseAuthCubit, lazy: false),
        ],
        child: Builder(
          builder: (context) {
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
              routes: const {},
            );
          },
        ),
      ),
    );
  }
}
