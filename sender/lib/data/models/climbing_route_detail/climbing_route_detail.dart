import 'package:freezed_annotation/freezed_annotation.dart';

part 'climbing_route_detail.freezed.dart';
part 'climbing_route_detail.g.dart';

@freezed
class ClimbingRouteDetail with _$ClimbingRouteDetail {
  factory ClimbingRouteDetail({
    required String title,
    required String content,
  }) = _ClimbingRouteDetail;

  factory ClimbingRouteDetail.fromJson(Map<String, dynamic> json) =>
      _$ClimbingRouteDetailFromJson(json);
}
