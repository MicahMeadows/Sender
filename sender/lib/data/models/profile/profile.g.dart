// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      uid: json['uid'] as String?,
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

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'routePreferences': instance.routePreferences,
      'routeTicks': instance.routeTicks,
    };
