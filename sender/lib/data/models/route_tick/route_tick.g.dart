// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_tick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteTickImpl _$$RouteTickImplFromJson(Map<String, dynamic> json) =>
    _$RouteTickImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      grade: json['grade'] as String,
      area: json['area'] as String,
      type: json['type'] as String,
      routeType: json['routeType'] as String?,
    );

Map<String, dynamic> _$$RouteTickImplToJson(_$RouteTickImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'grade': instance.grade,
      'area': instance.area,
      'type': instance.type,
      'routeType': instance.routeType,
    };
