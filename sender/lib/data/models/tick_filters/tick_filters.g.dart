// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tick_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TickFilters _$$_TickFiltersFromJson(Map<String, dynamic> json) =>
    _$_TickFilters(
      minGrade: json['minGrade'] as String? ?? '5.0',
      maxGrade: json['maxGrade'] as String? ?? '5.15d',
      minRating: (json['minRating'] as num?)?.toDouble() ?? 0,
      enableTopRope: json['enableTopRope'] as bool? ?? true,
      enableSport: json['enableSport'] as bool? ?? true,
      enableTrad: json['enableTrad'] as bool? ?? true,
    );

Map<String, dynamic> _$$_TickFiltersToJson(_$_TickFilters instance) =>
    <String, dynamic>{
      'minGrade': instance.minGrade,
      'maxGrade': instance.maxGrade,
      'minRating': instance.minRating,
      'enableTopRope': instance.enableTopRope,
      'enableSport': instance.enableSport,
      'enableTrad': instance.enableTrad,
    };
