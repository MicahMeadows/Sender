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
      ratingGroup: (json['ratingGroup'] as num).toDouble(),
      pitchesGroup: json['pitchesGroup'] as int,
      sort1: json['sort1'] as String,
      sort2: json['sort2'] as String,
    );

Map<String, dynamic> _$$_RouteSettingsToJson(_$_RouteSettings instance) =>
    <String, dynamic>{
      'areaId': instance.areaId,
      'minYds': instance.minYds,
      'maxYds': instance.maxYds,
      'showTrad': instance.showTrad,
      'showSport': instance.showSport,
      'showTopRope': instance.showTopRope,
      'ratingGroup': instance.ratingGroup,
      'pitchesGroup': instance.pitchesGroup,
      'sort1': instance.sort1,
      'sort2': instance.sort2,
    };
