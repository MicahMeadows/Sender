import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/area_select_cubit/area_select_cubit.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/navigation/navigation_cubit.dart';
import 'package:sender/data/cubits/route_preferences/route_settings_cubit.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/cubits/tick_filter/tick_filter_cubit.dart';
import 'package:sender/data/cubits/todo_list/todo_list_cubit.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';
import 'package:sender/data/repository/area_repository/retrofit_area_repository.dart';
import 'package:sender/data/repository/queue_route_repository/i_queue_route_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sender/data/repository/user_repository/caching_user_repository.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';
import 'package:sender/data/repository/user_repository/retrofit_user_repository.dart';
import 'package:sender/data/sender_api/retrofit_sender_api.dart';
import 'package:sender/firebase_options.dart';
import 'package:sender/widgets/auth_gate.dart';
import 'package:dio/dio.dart';
import 'data/models/area/area.dart';
import 'data/repository/queue_route_repository/retrofit_queue_route_repository.dart';
import 'package:sender/common/constants/colors.dart' as col;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

final InterceptorsWrapper firebaseAuthenticatorWrapper = InterceptorsWrapper(
  onRequest: (options, handler) async {
    var token = await _firebaseAuth.currentUser?.getIdToken();
    options.headers.addAll({"authtoken": token});
    return handler.next(options);
  },
);

final Dio _dioClient = Dio(BaseOptions(baseUrl: 'https://api.choss.rocks'))
  ..interceptors.add(firebaseAuthenticatorWrapper);

final RetrofitSenderApi _retrofitSenderApi = RetrofitSenderApi(_dioClient);

final IAreaRepository _areaRepository =
    RetrofitAreaRepository(_retrofitSenderApi);

final IQueueRouteRepository _queueRouteRepository =
    RetrofitQueueRouteRepository(_retrofitSenderApi);

final IUserRepository _userRepository = CachingUserRepository(
  RetrofitUserRepostiroy(_retrofitSenderApi),
);

final TickFilterCubit tickFilterCubit = TickFilterCubit();

final TodoListCubit todoListCubit = TodoListCubit(_userRepository)..loadTicks();

final AreaSelectCubit areaSelectCubit = AreaSelectCubit(
  _areaRepository,
  initialArea: const Area(
    id: "0",
    name: 'All Locations',
  ),
);

// initially load single route to get on page then force load more in background
final RouteQueueCubit routeQueueCubit = RouteQueueCubit(_queueRouteRepository)
  ..loadRoutes(loadCached: true, count: 3)
  ..queueUpRoutes(5);
final NavigationCubit navigationCubit = NavigationCubit();
final RouteSettingsCubit routeSettingsCubit = RouteSettingsCubit(
  userRepository: _userRepository,
  areaRepository: _areaRepository,
);
final FirebaseAuthCubit firebaseAuthCubit = FirebaseAuthCubit(
  firebaseAuth: _firebaseAuth,
  userRepository: _userRepository,
);

final ThemeData _themeData = ThemeData(
  fontFamily: 'Nunito',
  textTheme: TextTheme(
    bodySmall: GoogleFonts.nunito(fontSize: 16),
    bodyMedium: GoogleFonts.nunito(fontSize: 18),
    titleMedium: GoogleFonts.nunito(fontSize: 24),
  ).apply(bodyColor: Colors.white),
);

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
          BlocProvider(create: (_) => tickFilterCubit),
          BlocProvider(create: (_) => todoListCubit),
          BlocProvider(create: (_) => routeQueueCubit),
          BlocProvider(create: (_) => navigationCubit),
          BlocProvider(create: (_) => routeSettingsCubit),
          BlocProvider(create: (_) => firebaseAuthCubit, lazy: false),
          BlocProvider(create: (_) => areaSelectCubit),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'Sender',
              theme: _themeData,
              initialRoute: '/',
              home: const Scaffold(
                backgroundColor: col.background,
                body: SafeArea(
                  child: AuthGate(),
                ),
              ),
              routes: const {},
            );
          },
        ),
      ),
    );
  }
}
