import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';

part 'retrofit_sender_api.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8080/')
abstract class RetrofitSenderApi {
  factory RetrofitSenderApi(
    Dio dio, {
    String? baseUrl,
  }) = _RetrofitSenderApi;

  @GET('/user/preferences')
  Future<RoutePreferences> getUserPreferences();

  @POST('/user/preferences')
  Future<RoutePreferences> updateUserPreferences(
    @Body() RoutePreferences newPreferences,
  );

  // @POST('/user')
  // Future<Profile> createUser();

  @POST('/user/route')
  Future<RouteTick> setRouteTick(@Body() RouteTick tick);

  @GET('/user/route')
  Future<List<RouteTick>> getRouteTicks();
}
