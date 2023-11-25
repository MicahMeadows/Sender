import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';
part 'area.g.dart';

@Freezed(toJson: true, fromJson: true)
class Area with _$Area {
  const factory Area({
    required String id,
    required String name,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}
