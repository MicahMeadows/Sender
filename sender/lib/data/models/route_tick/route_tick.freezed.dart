// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$RouteTickCopyWithImpl<$Res, RouteTick>;
  @useResult
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
class _$RouteTickCopyWithImpl<$Res, $Val extends RouteTick>
    implements $RouteTickCopyWith<$Res> {
  _$RouteTickCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rating = null,
    Object? grade = null,
    Object? area = null,
    Object? type = null,
    Object? routeType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      routeType: freezed == routeType
          ? _value.routeType
          : routeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteTickImplCopyWith<$Res>
    implements $RouteTickCopyWith<$Res> {
  factory _$$RouteTickImplCopyWith(
          _$RouteTickImpl value, $Res Function(_$RouteTickImpl) then) =
      __$$RouteTickImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$RouteTickImplCopyWithImpl<$Res>
    extends _$RouteTickCopyWithImpl<$Res, _$RouteTickImpl>
    implements _$$RouteTickImplCopyWith<$Res> {
  __$$RouteTickImplCopyWithImpl(
      _$RouteTickImpl _value, $Res Function(_$RouteTickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rating = null,
    Object? grade = null,
    Object? area = null,
    Object? type = null,
    Object? routeType = freezed,
  }) {
    return _then(_$RouteTickImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      routeType: freezed == routeType
          ? _value.routeType
          : routeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteTickImpl implements _RouteTick {
  _$RouteTickImpl(
      {required this.id,
      required this.name,
      required this.rating,
      required this.grade,
      required this.area,
      required this.type,
      required this.routeType});

  factory _$RouteTickImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteTickImplFromJson(json);

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
            other is _$RouteTickImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.routeType, routeType) ||
                other.routeType == routeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, rating, grade, area, type, routeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteTickImplCopyWith<_$RouteTickImpl> get copyWith =>
      __$$RouteTickImplCopyWithImpl<_$RouteTickImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteTickImplToJson(
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
      required final String? routeType}) = _$RouteTickImpl;

  factory _RouteTick.fromJson(Map<String, dynamic> json) =
      _$RouteTickImpl.fromJson;

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
  _$$RouteTickImplCopyWith<_$RouteTickImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
