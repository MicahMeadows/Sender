import 'package:sender/common/networking/api_base_helper.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

class ApiUserRepository implements IUserRepository {
  final IRestApi _api;

  String _authToken =
      'eyJhbGciOiJSUzI1NiIsImtpZCI6IjZmOGUxY2IxNTY0MTQ2M2M2ZGYwZjMzMzk0YjAzYzkyZmNjODg5YWMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc2VuZGVyLTc2MjU2IiwiYXVkIjoic2VuZGVyLTc2MjU2IiwiYXV0aF90aW1lIjoxNjUzNzcxMTA3LCJ1c2VyX2lkIjoiaklKSXFJN2tURVp2Umd5cDl6Z1Exc0o1YU9sMSIsInN1YiI6ImpJSklxSTdrVEVadlJneXA5emdRMXNKNWFPbDEiLCJpYXQiOjE2NTM3NzExMDcsImV4cCI6MTY1Mzc3NDcwNywiZW1haWwiOiJtaWNhaG0yMTNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIm1pY2FobTIxM0BnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.Mic9ZmZL0H-WciFtgDAmmfXpCAGCwsPfYEPhCUYfp6nHKZYpWq7QPty4-wY_7rSlBsEuyeA6iL79E33OafSdhR8KQZtkdU2Us0e5L4cNS9FSa81_LKevnm0n5R3VIOpbBYNuUeFaoj3qVckxZj-i37rtiqj-UD8UhfC99orcBskptaA08gTDT0i9SS1CTFBczMtuZGXwThrebPs6RnR6YpXW6PiEzQRyzwRD3rgW2-Ih-Oo_tp2-UwUsNH6UZE5coaRm47gGHkY4oOGZWFPKYf9F1DmRvB_Tj9TAJgRwDZwDrZD_a-kV2FiqlvPEcFErU8Ep8XOQi9C-BAXqPHsAAA';

  ApiUserRepository(this._api);

  void setAuthToken(String newToken) {
    _authToken = newToken;
  }

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
      var response = await _api.get('user/preferences', headers: {
        'authtoken': _authToken,
      });

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
        headers: {
          'authtoken': _authToken,
        },
      );
    } catch (ex) {
      throw Exception('Failed to update preferences: $ex');
    }
  }
}
