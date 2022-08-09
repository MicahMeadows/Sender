import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

class CachingUserRepository implements IUserRepository {
  final IUserRepository _userRepository;

  Profile? loadedProfile;
  RoutePreferences? loadedRoutePreferences;
  List<RouteTick>? loadedRouteTicks;

  CachingUserRepository(this._userRepository);

  @override
  Future<Profile> createProfile(String displayName) async {
    loadedProfile = null;
    return await _userRepository.createProfile(displayName);
  }

  @override
  Future<void> deleteRouteTick(String routeToDeleteId) async {
    loadedRouteTicks = null;
    return await _userRepository.deleteRouteTick(routeToDeleteId);
  }

  @override
  Future<Profile> getProfile() async {
    try {
      loadedProfile ??= await _userRepository.getProfile();
      return Future.value(loadedProfile);
    } catch (ex) {
      return Future.error('Failed to load profile');
    }
  }

  @override
  Future<RoutePreferences> getRoutePreferences() async {
    try {
      loadedRoutePreferences ??= await _userRepository.getRoutePreferences();
      return Future.value(loadedRoutePreferences);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<RouteTick>> getTicks() async {
    try {
      loadedRouteTicks ??= await _userRepository.getTicks();
      return Future.value(loadedRouteTicks);
    } catch (ex) {
      return Future.error('Failed to load route ticks');
    }
  }

  @override
  Future<void> setRouteTick(RouteTick routeTick) async {
    loadedRouteTicks = null;
    return await _userRepository.setRouteTick(routeTick);
  }

  @override
  Future<Profile> updateProfile(Profile newProfile) async {
    loadedProfile = null;
    return await _userRepository.updateProfile(newProfile);
  }

  @override
  Future<void> updateRoutePreferences(RoutePreferences routeSettings) async {
    loadedRoutePreferences = null;
    return _userRepository.updateRoutePreferences(routeSettings);
  }
}
