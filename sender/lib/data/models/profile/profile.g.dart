// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      routePreferences: json['routePreferences'] == null
          ? null
          : RoutePreferences.fromJson(
              json['routePreferences'] as Map<String, dynamic>),
      routeTicks: (json['routeTicks'] as List<dynamic>?)
          ?.map((e) => RouteTick.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'routePreferences': instance.routePreferences,
      'routeTicks': instance.routeTicks,
    };
