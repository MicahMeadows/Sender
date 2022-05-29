import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

import '../../../common/networking/i_rest_api.dart';

class ApiUserRepository implements IUserRepository {
  final IRestApi _api;

  ApiUserRepository(this._api);

  @override
  Future<Profile> createProfile(String displayName) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRouteTick(String routeToDeleteId) {
    throw UnimplementedError();
  }

  @override
  Future<Profile> getProfile() {
    throw UnimplementedError();
  }

  @override
  Future<RoutePreferences> getRoutePreferences() async {
    try {
      var response = await _api.get('user/preferences');

      if (response == null) throw Exception('Preferences are null');

      var preferences = RoutePreferences.fromJson(response);

      return preferences;
    } catch (ex) {
      throw Exception('Failed to get route preferences: ($ex)');
    }
  }

  @override
  Future<void> setRouteTick(RouteTick routeTick) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRoutePreferences(RoutePreferences routeSettings) async {
    try {
      var body = routeSettings.toJson();

      await _api.post(
        'user/preferences',
        body: body,
      );
    } catch (ex) {
      throw Exception('Failed to update preferences: $ex');
    }
  }
}
