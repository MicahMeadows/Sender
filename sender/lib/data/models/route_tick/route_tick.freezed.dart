// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route_tick.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouteTick _$RouteTickFromJson(Map<String, dynamic> json) {
  return _RouteTick.fromJson(json);
}

/// @nodoc
mixin _$RouteTick {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get grade => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get routeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteTickCopyWith<RouteTick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteTickCopyWith<$Res> {
  factory $RouteTickCopyWith(RouteTick value, $Res Function(RouteTick) then) =
      _$RouteTickCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      double rating,
      String grade,
      String area,
      String type,
      String? routeType});
}

/// @nodoc
class _$RouteTickCopyWithImpl<$Res> implements $RouteTickCopyWith<$Res> {
  _$RouteTickCopyWithImpl(this._value, this._then);

  final RouteTick _value;
  // ignore: unused_field
  final $Res Function(RouteTick) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? grade = freezed,
    Object? area = freezed,
    Object? type = freezed,
    Object? routeType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      routeType: routeType == freezed
          ? _value.routeType
          : routeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RouteTickCopyWith<$Res> implements $RouteTickCopyWith<$Res> {
  factory _$$_RouteTickCopyWith(
          _$_RouteTick value, $Res Function(_$_RouteTick) then) =
      __$$_RouteTickCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      double rating,
      String grade,
      String area,
      String type,
      String? routeType});
}

/// @nodoc
class __$$_RouteTickCopyWithImpl<$Res> extends _$RouteTickCopyWithImpl<$Res>
    implements _$$_RouteTickCopyWith<$Res> {
  __$$_RouteTickCopyWithImpl(
      _$_RouteTick _value, $Res Function(_$_RouteTick) _then)
      : super(_value, (v) => _then(v as _$_RouteTick));

  @override
  _$_RouteTick get _value => super._value as _$_RouteTick;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? grade = freezed,
    Object? area = freezed,
    Object? type = freezed,
    Object? routeType = freezed,
  }) {
    return _then(_$_RouteTick(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      routeType: routeType == freezed
          ? _value.routeType
          : routeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteTick implements _RouteTick {
  _$_RouteTick(
      {required this.id,
      required this.name,
      required this.rating,
      required this.grade,
      required this.area,
      required this.type,
      required this.routeType});

  factory _$_RouteTick.fromJson(Map<String, dynamic> json) =>
      _$$_RouteTickFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double rating;
  @override
  final String grade;
  @override
  final String area;
  @override
  final String type;
  @override
  final String? routeType;

  @override
  String toString() {
    return 'RouteTick(id: $id, name: $name, rating: $rating, grade: $grade, area: $area, type: $type, routeType: $routeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteTick &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.grade, grade) &&
            const DeepCollectionEquality().equals(other.area, area) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.routeType, routeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(grade),
      const DeepCollectionEquality().hash(area),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(routeType));

  @JsonKey(ignore: true)
  @override
  _$$_RouteTickCopyWith<_$_RouteTick> get copyWith =>
      __$$_RouteTickCopyWithImpl<_$_RouteTick>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteTickToJson(
      this,
    );
  }
}

abstract class _RouteTick implements RouteTick {
  factory _RouteTick(
      {required final String id,
      required final String name,
      required final double rating,
      required final String grade,
      required final String area,
      required final String type,
      required final String? routeType}) = _$_RouteTick;

  factory _RouteTick.fromJson(Map<String, dynamic> json) =
      _$_RouteTick.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get rating;
  @override
  String get grade;
  @override
  String get area;
  @override
  String get type;
  @override
  String? get routeType;
  @override
  @JsonKey(ignore: true)
  _$$_RouteTickCopyWith<_$_RouteTick> get copyWith =>
      throw _privateConstructorUsedError;
}
