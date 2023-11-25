// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$ClimbingRouteDetailCopyWithImpl<$Res, ClimbingRouteDetail>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$ClimbingRouteDetailCopyWithImpl<$Res, $Val extends ClimbingRouteDetail>
    implements $ClimbingRouteDetailCopyWith<$Res> {
  _$ClimbingRouteDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClimbingRouteDetailImplCopyWith<$Res>
    implements $ClimbingRouteDetailCopyWith<$Res> {
  factory _$$ClimbingRouteDetailImplCopyWith(_$ClimbingRouteDetailImpl value,
          $Res Function(_$ClimbingRouteDetailImpl) then) =
      __$$ClimbingRouteDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$ClimbingRouteDetailImplCopyWithImpl<$Res>
    extends _$ClimbingRouteDetailCopyWithImpl<$Res, _$ClimbingRouteDetailImpl>
    implements _$$ClimbingRouteDetailImplCopyWith<$Res> {
  __$$ClimbingRouteDetailImplCopyWithImpl(_$ClimbingRouteDetailImpl _value,
      $Res Function(_$ClimbingRouteDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$ClimbingRouteDetailImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClimbingRouteDetailImpl implements _ClimbingRouteDetail {
  _$ClimbingRouteDetailImpl({required this.title, required this.content});

  factory _$ClimbingRouteDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClimbingRouteDetailImplFromJson(json);

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
            other is _$ClimbingRouteDetailImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClimbingRouteDetailImplCopyWith<_$ClimbingRouteDetailImpl> get copyWith =>
      __$$ClimbingRouteDetailImplCopyWithImpl<_$ClimbingRouteDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClimbingRouteDetailImplToJson(
      this,
    );
  }
}

abstract class _ClimbingRouteDetail implements ClimbingRouteDetail {
  factory _ClimbingRouteDetail(
      {required final String title,
      required final String content}) = _$ClimbingRouteDetailImpl;

  factory _ClimbingRouteDetail.fromJson(Map<String, dynamic> json) =
      _$ClimbingRouteDetailImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$ClimbingRouteDetailImplCopyWith<_$ClimbingRouteDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
