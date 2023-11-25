// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? uid,
      String email,
      String displayName,
      RoutePreferences? routePreferences,
      List<RouteTick>? routeTicks});

  $RoutePreferencesCopyWith<$Res>? get routePreferences;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = null,
    Object? displayName = null,
    Object? routePreferences = freezed,
    Object? routeTicks = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      routePreferences: freezed == routePreferences
          ? _value.routePreferences
          : routePreferences // ignore: cast_nullable_to_non_nullable
              as RoutePreferences?,
      routeTicks: freezed == routeTicks
          ? _value.routeTicks
          : routeTicks // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoutePreferencesCopyWith<$Res>? get routePreferences {
    if (_value.routePreferences == null) {
      return null;
    }

    return $RoutePreferencesCopyWith<$Res>(_value.routePreferences!, (value) {
      return _then(_value.copyWith(routePreferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = null,
    Object? displayName = null,
    Object? routePreferences = freezed,
    Object? routeTicks = freezed,
  }) {
    return _then(_$ProfileImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      routePreferences: freezed == routePreferences
          ? _value.routePreferences
          : routePreferences // ignore: cast_nullable_to_non_nullable
              as RoutePreferences?,
      routeTicks: freezed == routeTicks
          ? _value._routeTicks
          : routeTicks // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  _$ProfileImpl(
      {this.uid,
      required this.email,
      required this.displayName,
      this.routePreferences,
      final List<RouteTick>? routeTicks})
      : _routeTicks = routeTicks;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

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
    if (_routeTicks is EqualUnmodifiableListView) return _routeTicks;
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
            other is _$ProfileImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.routePreferences, routePreferences) ||
                other.routePreferences == routePreferences) &&
            const DeepCollectionEquality()
                .equals(other._routeTicks, _routeTicks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, displayName,
      routePreferences, const DeepCollectionEquality().hash(_routeTicks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
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
      final List<RouteTick>? routeTicks}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

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
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
