// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_tick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteTick _$$_RouteTickFromJson(Map<String, dynamic> json) => _$_RouteTick(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      grade: json['grade'] as String,
      area: json['area'] as String,
      todo: json['todo'] as String,
    );

Map<String, dynamic> _$$_RouteTickToJson(_$_RouteTick instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'grade': instance.grade,
      'area': instance.area,
      'todo': instance.todo,
    };
