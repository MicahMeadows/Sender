import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/models/climbing_route/climbing_route.dart';

part 'route_tick.freezed.dart';
part 'route_tick.g.dart';

@freezed
class RouteTick with _$RouteTick {
  factory RouteTick({
    required String id,
    required String name,
    required double rating,
    required String grade,
    required String area,
    required String type,
  }) = _RouteTick;

  factory RouteTick.fromJson(Map<String, dynamic> json) =>
      _$RouteTickFromJson(json);

  static RouteTick makeTick(String tickType, ClimbingRoute route) {
    return RouteTick(
      id: route.id,
      name: route.name,
      rating: route.rating,
      grade: route.grade,
      area: 'replace me',
      type: tickType,
    );
  }
}
