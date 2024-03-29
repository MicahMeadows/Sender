import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';

abstract class IUserRepository {
  Future<void> updateRoutePreferences(RoutePreferences routeSettings);
  Future<RoutePreferences> getRoutePreferences();
  Future<void> setRouteTick(RouteTick routeTick);
  Future<void> deleteRouteTick(String routeToDeleteId);
  Future<List<RouteTick>> getTicks();
  Future<Profile> createProfile(String email, String displayName);
  Future<Profile> updateProfile(Profile newProfile);
  Future<Profile> getProfile();
}
