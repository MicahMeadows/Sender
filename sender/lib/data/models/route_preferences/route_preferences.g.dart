// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutePreferences _$$_RoutePreferencesFromJson(Map<String, dynamic> json) =>
    _$_RoutePreferences(
      areaId: json['areaId'] as String,
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
      'areaId': instance.areaId,
      'minGrade': instance.minGrade,
      'maxGrade': instance.maxGrade,
      'showTrad': instance.showTrad,
      'showSport': instance.showSport,
      'showTopRope': instance.showTopRope,
      'minRating': instance.minRating,
      'showMultipitch': instance.showMultipitch,
    };
