import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';
import 'package:sender/data/sender_api/retrofit_sender_api.dart';

class RetrofitUserRepostiroy implements IUserRepository {
  final RetrofitSenderApi _api;

  RetrofitUserRepostiroy(this._api);

  @override
  Future<Profile> createProfile(String displayName) {
    // TODO: implement createProfile
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRouteTick(String routeToDeleteId) async {
    await _api.removeRouteTick(routeToDeleteId);
  }

  @override
  Future<Profile> getProfile() {
    throw UnimplementedError();
  }

  @override
  Future<RoutePreferences> getRoutePreferences() async {
    return await _api.getUserPreferences();
  }

  @override
  Future<List<RouteTick>> getTicks() async {
    return await _api.getRouteTicks();
  }

  @override
  Future<void> setRouteTick(RouteTick routeTick) async {
    await _api.setRouteTick(routeTick);
  }

  @override
  Future<Profile> updateProfile(Profile newProfile) {
    // TODO: impplement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateRoutePreferences(RoutePreferences routeSettings) async {
    await _api.updateUserPreferences(routeSettings);
  }
}
