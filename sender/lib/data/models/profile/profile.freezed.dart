// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  RoutePreferences? get routePreferences => throw _privateConstructorUsedError;
  List<RouteTick>? get routeTicks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      String email,
      String displayName,
      RoutePreferences? routePreferences,
      List<RouteTick>? routeTicks});

  $RoutePreferencesCopyWith<$Res>? get routePreferences;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? routePreferences = freezed,
    Object? routeTicks = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      routePreferences: routePreferences == freezed
          ? _value.routePreferences
          : routePreferences // ignore: cast_nullable_to_non_nullable
              as RoutePreferences?,
      routeTicks: routeTicks == freezed
          ? _value.routeTicks
          : routeTicks // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>?,
    ));
  }

  @override
  $RoutePreferencesCopyWith<$Res>? get routePreferences {
    if (_value.routePreferences == null) {
      return null;
    }

    return $RoutePreferencesCopyWith<$Res>(_value.routePreferences!, (value) {
      return _then(_value.copyWith(routePreferences: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      String email,
      String displayName,
      RoutePreferences? routePreferences,
      List<RouteTick>? routeTicks});

  @override
  $RoutePreferencesCopyWith<$Res>? get routePreferences;
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, (v) => _then(v as _$_Profile));

  @override
  _$_Profile get _value => super._value as _$_Profile;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? routePreferences = freezed,
    Object? routeTicks = freezed,
  }) {
    return _then(_$_Profile(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      routePreferences: routePreferences == freezed
          ? _value.routePreferences
          : routePreferences // ignore: cast_nullable_to_non_nullable
              as RoutePreferences?,
      routeTicks: routeTicks == freezed
          ? _value._routeTicks
          : routeTicks // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  _$_Profile(
      {this.uid,
      required this.email,
      required this.displayName,
      this.routePreferences,
      final List<RouteTick>? routeTicks})
      : _routeTicks = routeTicks;

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final String? uid;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final RoutePreferences? routePreferences;
  final List<RouteTick>? _routeTicks;
  @override
  List<RouteTick>? get routeTicks {
    final value = _routeTicks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Profile(uid: $uid, email: $email, displayName: $displayName, routePreferences: $routePreferences, routeTicks: $routeTicks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.routePreferences, routePreferences) &&
            const DeepCollectionEquality()
                .equals(other._routeTicks, _routeTicks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(routePreferences),
      const DeepCollectionEquality().hash(_routeTicks));

  @JsonKey(ignore: true)
  @override
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {final String? uid,
      required final String email,
      required final String displayName,
      final RoutePreferences? routePreferences,
      final List<RouteTick>? routeTicks}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String? get uid;
  @override
  String get email;
  @override
  String get displayName;
  @override
  RoutePreferences? get routePreferences;
  @override
  List<RouteTick>? get routeTicks;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
