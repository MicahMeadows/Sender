import 'package:freezed_annotation/freezed_annotation.dart';

import '../area/area.dart';

part 'route_preferences.freezed.dart';
part 'route_preferences.g.dart';

@freezed
class RoutePreferences with _$RoutePreferences {
  const factory RoutePreferences({
    // required String areaId,
    required Area area,
    required String minGrade,
    required String maxGrade,
    required bool showTrad,
    required bool showSport,
    required bool showTopRope,
    required double minRating,
    required bool showMultipitch,
  }) = _RoutePreferences;

  factory RoutePreferences.newPreferences() {
    return const RoutePreferences(
      // areaId: "0",
      area: Area(id: "0", name: "All Locations"),
      minGrade: "5.0",
      maxGrade: "5.15d",
      showTrad: true,
      showSport: true,
      showTopRope: true,
      minRating: 0,
      showMultipitch: true,
    );
  }

  factory RoutePreferences.fromJson(Map<String, dynamic> json) =>
      _$RoutePreferencesFromJson(json);
}
