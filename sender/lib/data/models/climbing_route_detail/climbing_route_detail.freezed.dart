// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'climbing_route_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClimbingRouteDetail _$ClimbingRouteDetailFromJson(Map<String, dynamic> json) {
  return _ClimbingRouteDetail.fromJson(json);
}

/// @nodoc
mixin _$ClimbingRouteDetail {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClimbingRouteDetailCopyWith<ClimbingRouteDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClimbingRouteDetailCopyWith<$Res> {
  factory $ClimbingRouteDetailCopyWith(
          ClimbingRouteDetail value, $Res Function(ClimbingRouteDetail) then) =
      _$ClimbingRouteDetailCopyWithImpl<$Res>;
  $Res call({String title, String content});
}

/// @nodoc
class _$ClimbingRouteDetailCopyWithImpl<$Res>
    implements $ClimbingRouteDetailCopyWith<$Res> {
  _$ClimbingRouteDetailCopyWithImpl(this._value, this._then);

  final ClimbingRouteDetail _value;
  // ignore: unused_field
  final $Res Function(ClimbingRouteDetail) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ClimbingRouteDetailCopyWith<$Res>
    implements $ClimbingRouteDetailCopyWith<$Res> {
  factory _$$_ClimbingRouteDetailCopyWith(_$_ClimbingRouteDetail value,
          $Res Function(_$_ClimbingRouteDetail) then) =
      __$$_ClimbingRouteDetailCopyWithImpl<$Res>;
  @override
  $Res call({String title, String content});
}

/// @nodoc
class __$$_ClimbingRouteDetailCopyWithImpl<$Res>
    extends _$ClimbingRouteDetailCopyWithImpl<$Res>
    implements _$$_ClimbingRouteDetailCopyWith<$Res> {
  __$$_ClimbingRouteDetailCopyWithImpl(_$_ClimbingRouteDetail _value,
      $Res Function(_$_ClimbingRouteDetail) _then)
      : super(_value, (v) => _then(v as _$_ClimbingRouteDetail));

  @override
  _$_ClimbingRouteDetail get _value => super._value as _$_ClimbingRouteDetail;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ClimbingRouteDetail(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClimbingRouteDetail implements _ClimbingRouteDetail {
  _$_ClimbingRouteDetail({required this.title, required this.content});

  factory _$_ClimbingRouteDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ClimbingRouteDetailFromJson(json);

  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'ClimbingRouteDetail(title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClimbingRouteDetail &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_ClimbingRouteDetailCopyWith<_$_ClimbingRouteDetail> get copyWith =>
      __$$_ClimbingRouteDetailCopyWithImpl<_$_ClimbingRouteDetail>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClimbingRouteDetailToJson(
      this,
    );
  }
}

abstract class _ClimbingRouteDetail implements ClimbingRouteDetail {
  factory _ClimbingRouteDetail(
      {required final String title,
      required final String content}) = _$_ClimbingRouteDetail;

  factory _ClimbingRouteDetail.fromJson(Map<String, dynamic> json) =
      _$_ClimbingRouteDetail.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_ClimbingRouteDetailCopyWith<_$_ClimbingRouteDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
