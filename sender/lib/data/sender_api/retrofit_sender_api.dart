import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';

part 'retrofit_sender_api.g.dart';

@RestApi(
    baseUrl: 'https://bcfb-2603-9001-7301-7731-7dfe-aa9d-7a0f-8057.ngrok.io')
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

  @POST('/user/tick')
  Future<RouteTick> setRouteTick(@Body() RouteTick tick);

  @DELETE('/user/tick/{id}')
  Future<void> removeRouteTick(@Path() String id);

  @GET('/user/tick')
  Future<List<RouteTick>> getRouteTicks();

  @GET('/routes/queue')
  Future<List<ClimbingRoute>> getQueueRoutes({
    @Query('includePageData') String includePageData = 'true',
    @Query('numResults') int? numResults,
  });
}
