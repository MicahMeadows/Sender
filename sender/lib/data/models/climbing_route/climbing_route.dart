import 'package:freezed_annotation/freezed_annotation.dart';

import '../area/area.dart';
import '../climbing_route_detail/climbing_route_detail.dart';

part 'climbing_route.freezed.dart';
part 'climbing_route.g.dart';

@freezed
class ClimbingRoute with _$ClimbingRoute {
  factory ClimbingRoute({
    required String id,
    required String? grade,
    required String name,
    required String? area,
    required double? rating,
    required String? type,
    required int? pitches,
    required int? length,
    required double? longitude,
    required double? latitude,
    required String? firstAscent,
    required List<String>? imageUrls,
    required List<Area>? areas,
    // required List<String>? areas,
    required List<ClimbingRouteDetail>? details,
  }) = _ClimbingRoute;

  factory ClimbingRoute.fromJson(Map<String, dynamic> json) =>
      _$ClimbingRouteFromJson(json);
}
