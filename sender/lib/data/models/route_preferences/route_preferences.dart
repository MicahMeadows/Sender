import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_preferences.freezed.dart';
part 'route_preferences.g.dart';

@freezed
class RoutePreferences with _$RoutePreferences {
  const factory RoutePreferences({
    required String areaId,
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
      areaId: "0",
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
