// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tick_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TickFilters _$$_TickFiltersFromJson(Map<String, dynamic> json) =>
    _$_TickFilters(
      minGrade: json['minGrade'] as String?,
      maxGrade: json['maxGrade'] as String?,
      minRating: (json['minRating'] as num?)?.toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_TickFiltersToJson(_$_TickFilters instance) =>
    <String, dynamic>{
      'minGrade': instance.minGrade,
      'maxGrade': instance.maxGrade,
      'minRating': instance.minRating,
      'type': instance.type,
    };
