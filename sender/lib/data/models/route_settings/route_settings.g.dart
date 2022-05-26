// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteSettings _$$_RouteSettingsFromJson(Map<String, dynamic> json) =>
    _$_RouteSettings(
      areaId: json['areaId'] as String,
      minYds: json['minYds'] as String,
      maxYds: json['maxYds'] as String,
      showTrad: json['showTrad'] as bool,
      showSport: json['showSport'] as bool,
      showTopRope: json['showTopRope'] as bool,
      minRating: json['minRating'] as int,
      showMultipitch: json['showMultipitch'] as bool,
    );

Map<String, dynamic> _$$_RouteSettingsToJson(_$_RouteSettings instance) =>
    <String, dynamic>{
      'areaId': instance.areaId,
      'minYds': instance.minYds,
      'maxYds': instance.maxYds,
      'showTrad': instance.showTrad,
      'showSport': instance.showSport,
      'showTopRope': instance.showTopRope,
      'minRating': instance.minRating,
      'showMultipitch': instance.showMultipitch,
    };
