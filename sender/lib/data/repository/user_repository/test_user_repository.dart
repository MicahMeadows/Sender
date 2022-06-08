import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/models/profile/profile.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

class TestUserRepository implements IUserRepository {
  var _profile = Profile(
    email: 'micahm213@gmail.com',
    displayName: 'Micah Meadows',
  );

  final List<RouteTick> _ticks = [
    // RouteTick(
    //   id: '0',
    //   name: 'Different Strokes',
    //   rating: 3,
    //   grade: '5.11c',
    //   area: 'Gallery > PMRP > RRG > Kentucky',
    //   type: 'todo',
    // ),
    // RouteTick(
    //   id: '1',
    //   name: 'Tesseract',
    //   rating: 2.3,
    //   grade: '5.10d',
    //   area: 'Portal > MFRP > RRG > Kentucky',
    //   type: 'sent',
    // ),
    // RouteTick(
    //   id: '2',
    //   name: 'Fuzzy Undercling',
    //   rating: 3.4,
    //   grade: '5.11b',
    //   area: 'Left Flank > North Gorge > RRG > Kentucky',
    //   type: 'sent',
    // ),
    // RouteTick(
    //   id: '3',
    //   name: 'Air Ride Equipped',
    //   rating: 3.1,
    //   grade: '5.11a',
    //   area: 'Solarium > Muir Valley > RRG > Kentucky',
    //   type: 'skip',
    // ),
  ];

  var _preferences = const RoutePreferences(
    areaId: '0',
    minGrade: '5.9',
    maxGrade: '5.11c',
    showTrad: true,
    showSport: true,
    showTopRope: false,
    minRating: 2,
    showMultipitch: false,
  );

  @override
  Future<Profile> createProfile(String displayName) {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => _profile,
    );
  }

  @override
  Future<void> deleteRouteTick(String routeToDeleteId) {
    _ticks.removeWhere((element) => element.id == routeToDeleteId);
    return Future.delayed(const Duration(milliseconds: 700));
  }

  @override
  Future<Profile> getProfile() {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => _profile,
    );
  }

  @override
  Future<RoutePreferences> getRoutePreferences() {
    return Future.delayed(
      const Duration(milliseconds: 750),
      () => _preferences,
    );
  }

  @override
  Future<void> setRouteTick(RouteTick routeTick) {
    _ticks.add(routeTick);
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> updateRoutePreferences(RoutePreferences routeSettings) {
    _preferences = routeSettings;
    return Future.delayed(const Duration(milliseconds: 700));
  }

  @override
  Future<Profile> updateProfile(Profile newProfile) {
    _profile = newProfile;
    return Future.delayed(const Duration(milliseconds: 700));
  }

  @override
  Future<List<RouteTick>> getTicks() {
    return Future.delayed(const Duration(milliseconds: 500), () => _ticks);
  }
}
