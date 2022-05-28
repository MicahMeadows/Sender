import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';

import '../route_tick/route_tick.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    required String email,
    required String displayName,
    RoutePreferences? routePreferences,
    List<RouteTick>? routeTicks,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
