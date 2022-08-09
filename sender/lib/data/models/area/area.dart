import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class Area {
  final String id;
  final int? level;
  final String name;

  const Area({
    required this.id,
    required this.name,
    this.level,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
