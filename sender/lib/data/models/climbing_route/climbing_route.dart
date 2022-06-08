import 'package:freezed_annotation/freezed_annotation.dart';

import '../area/area.dart';

part 'climbing_route.freezed.dart';
part 'climbing_route.g.dart';

@freezed
class ClimbingRoute with _$ClimbingRoute {
  factory ClimbingRoute({
    required String name,
    required String grade,
    required String type,
    required double rating,
    required int height,
    required String firstAscent,
    required String description,
    required String protection,
    required String location,
    required List<Area> areas,
    required List<String> imageUrls,
    required String id,
  }) = _ClimbingRoute;

  factory ClimbingRoute.fromJson(Map<String, dynamic> json) =>
      _$ClimbingRouteFromJson(json);
}
