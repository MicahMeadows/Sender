import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_settings.freezed.dart';
part 'route_settings.g.dart';

@freezed
class RouteSettings with _$RouteSettings {
  const factory RouteSettings({
    required String areaId,
    required String minYds,
    required String maxYds,
    required bool showTrad,
    required bool showSport,
    required bool showTopRope,
    required int minRating,
    required bool showMultipitch,
  }) = _RouteSettings;

  factory RouteSettings.fromJson(Map<String, dynamic> json) =>
      _$RouteSettingsFromJson(json);
}
