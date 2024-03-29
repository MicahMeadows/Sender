// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climbing_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClimbingRouteImpl _$$ClimbingRouteImplFromJson(Map<String, dynamic> json) =>
    _$ClimbingRouteImpl(
      id: json['id'] as String,
      grade: json['grade'] as String?,
      name: json['name'] as String,
      area: json['area'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      type: json['type'] as String?,
      pitches: json['pitches'] as int?,
      length: json['length'] as int?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      firstAscent: json['firstAscent'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ClimbingRouteDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClimbingRouteImplToJson(_$ClimbingRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade': instance.grade,
      'name': instance.name,
      'area': instance.area,
      'rating': instance.rating,
      'type': instance.type,
      'pitches': instance.pitches,
      'length': instance.length,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'firstAscent': instance.firstAscent,
      'imageUrls': instance.imageUrls,
      'areas': instance.areas,
      'details': instance.details,
    };
