// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climbing_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClimbingRoute _$$_ClimbingRouteFromJson(Map<String, dynamic> json) =>
    _$_ClimbingRoute(
      name: json['name'] as String,
      grade: json['grade'] as String,
      type: json['type'] as String,
      rating: (json['rating'] as num).toDouble(),
      height: json['height'] as int,
      firstAscent: json['firstAscent'] as String,
      description: json['description'] as String,
      protection: json['protection'] as String,
      location: json['location'] as String,
      areas: (json['areas'] as List<dynamic>)
          .map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_ClimbingRouteToJson(_$_ClimbingRoute instance) =>
    <String, dynamic>{
      'name': instance.name,
      'grade': instance.grade,
      'type': instance.type,
      'rating': instance.rating,
      'height': instance.height,
      'firstAscent': instance.firstAscent,
      'description': instance.description,
      'protection': instance.protection,
      'location': instance.location,
      'areas': instance.areas,
      'imageUrls': instance.imageUrls,
      'id': instance.id,
    };
