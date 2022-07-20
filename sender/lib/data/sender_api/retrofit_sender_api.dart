import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sender/data/models/climbing_route/climbing_route.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';

part 'retrofit_sender_api.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8080')
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

  @GET('/routes/{id}/details')
  Future<ClimbingRoute> getRouteDetails(@Path("id") String id);

  @POST('/user/tick')
  Future<RouteTick> setRouteTick(@Body() RouteTick tick);

  @DELETE('/user/tick/{id}')
  Future<void> removeRouteTick(@Path() String id);

  @GET('/user/tick')
  Future<List<RouteTick>> getRouteTicks();

  @POST('/routes/queue')
  Future<List<ClimbingRoute>> getQueueRoutes({
    @Body() Map<String, dynamic> settings = const {
      "ignore": [],
    },
    @Query('includePageData') String includePageData = 'true',
    @Query('needImages') String needImages = 'true',
    @Query('numResults') int? numResults,
  });
}
