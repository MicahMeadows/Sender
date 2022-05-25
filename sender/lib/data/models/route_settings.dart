import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_settings.freezed.dart';

@freezed
class RouteSettings with _$RouteSettings {
  const factory RouteSettings({
    required String areaId,
    required String minYds,
    required String maxYds,
    required bool showTrad,
    required bool showSport,
    required bool showTopRope,
    required double ratingGroup,
    required int pitchesGroup,
    required String sort1,
    required String sort2,
  }) = _RouteSettings;
}
