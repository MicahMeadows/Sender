// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutePreferences _$$_RoutePreferencesFromJson(Map<String, dynamic> json) =>
    _$_RoutePreferences(
      area: Area.fromJson(json['area'] as Map<String, dynamic>),
      minGrade: json['minGrade'] as String,
      maxGrade: json['maxGrade'] as String,
      showTrad: json['showTrad'] as bool,
      showSport: json['showSport'] as bool,
      showTopRope: json['showTopRope'] as bool,
      minRating: (json['minRating'] as num).toDouble(),
      showMultipitch: json['showMultipitch'] as bool,
    );

Map<String, dynamic> _$$_RoutePreferencesToJson(_$_RoutePreferences instance) =>
    <String, dynamic>{
      'area': instance.area,
      'minGrade': instance.minGrade,
      'maxGrade': instance.maxGrade,
      'showTrad': instance.showTrad,
      'showSport': instance.showSport,
      'showTopRope': instance.showTopRope,
      'minRating': instance.minRating,
      'showMultipitch': instance.showMultipitch,
    };
