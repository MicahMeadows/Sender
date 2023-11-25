// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tick_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TickFilters _$TickFiltersFromJson(Map<String, dynamic> json) {
  return _TickFilters.fromJson(json);
}

/// @nodoc
mixin _$TickFilters {
  String get minGrade => throw _privateConstructorUsedError;
  String get maxGrade => throw _privateConstructorUsedError;
  double get minRating => throw _privateConstructorUsedError;
  bool get disableTopRope => throw _privateConstructorUsedError;
  bool get disableSport => throw _privateConstructorUsedError;
  bool get disableTrad => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TickFiltersCopyWith<TickFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TickFiltersCopyWith<$Res> {
  factory $TickFiltersCopyWith(
          TickFilters value, $Res Function(TickFilters) then) =
      _$TickFiltersCopyWithImpl<$Res, TickFilters>;
  @useResult
  $Res call(
      {String minGrade,
      String maxGrade,
      double minRating,
      bool disableTopRope,
      bool disableSport,
      bool disableTrad});
}

/// @nodoc
class _$TickFiltersCopyWithImpl<$Res, $Val extends TickFilters>
    implements $TickFiltersCopyWith<$Res> {
  _$TickFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minGrade = null,
    Object? maxGrade = null,
    Object? minRating = null,
    Object? disableTopRope = null,
    Object? disableSport = null,
    Object? disableTrad = null,
  }) {
    return _then(_value.copyWith(
      minGrade: null == minGrade
          ? _value.minGrade
          : minGrade // ignore: cast_nullable_to_non_nullable
              as String,
      maxGrade: null == maxGrade
          ? _value.maxGrade
          : maxGrade // ignore: cast_nullable_to_non_nullable
              as String,
      minRating: null == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      disableTopRope: null == disableTopRope
          ? _value.disableTopRope
          : disableTopRope // ignore: cast_nullable_to_non_nullable
              as bool,
      disableSport: null == disableSport
          ? _value.disableSport
          : disableSport // ignore: cast_nullable_to_non_nullable
              as bool,
      disableTrad: null == disableTrad
          ? _value.disableTrad
          : disableTrad // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TickFiltersImplCopyWith<$Res>
    implements $TickFiltersCopyWith<$Res> {
  factory _$$TickFiltersImplCopyWith(
          _$TickFiltersImpl value, $Res Function(_$TickFiltersImpl) then) =
      __$$TickFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String minGrade,
      String maxGrade,
      double minRating,
      bool disableTopRope,
      bool disableSport,
      bool disableTrad});
}

/// @nodoc
class __$$TickFiltersImplCopyWithImpl<$Res>
    extends _$TickFiltersCopyWithImpl<$Res, _$TickFiltersImpl>
    implements _$$TickFiltersImplCopyWith<$Res> {
  __$$TickFiltersImplCopyWithImpl(
      _$TickFiltersImpl _value, $Res Function(_$TickFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minGrade = null,
    Object? maxGrade = null,
    Object? minRating = null,
    Object? disableTopRope = null,
    Object? disableSport = null,
    Object? disableTrad = null,
  }) {
    return _then(_$TickFiltersImpl(
      minGrade: null == minGrade
          ? _value.minGrade
          : minGrade // ignore: cast_nullable_to_non_nullable
              as String,
      maxGrade: null == maxGrade
          ? _value.maxGrade
          : maxGrade // ignore: cast_nullable_to_non_nullable
              as String,
      minRating: null == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      disableTopRope: null == disableTopRope
          ? _value.disableTopRope
          : disableTopRope // ignore: cast_nullable_to_non_nullable
              as bool,
      disableSport: null == disableSport
          ? _value.disableSport
          : disableSport // ignore: cast_nullable_to_non_nullable
              as bool,
      disableTrad: null == disableTrad
          ? _value.disableTrad
          : disableTrad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TickFiltersImpl extends _TickFilters {
  _$TickFiltersImpl(
      {this.minGrade = '5.0',
      this.maxGrade = '5.15d',
      this.minRating = 0,
      this.disableTopRope = false,
      this.disableSport = false,
      this.disableTrad = false})
      : super._();

  factory _$TickFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$TickFiltersImplFromJson(json);

  @override
  @JsonKey()
  final String minGrade;
  @override
  @JsonKey()
  final String maxGrade;
  @override
  @JsonKey()
  final double minRating;
  @override
  @JsonKey()
  final bool disableTopRope;
  @override
  @JsonKey()
  final bool disableSport;
  @override
  @JsonKey()
  final bool disableTrad;

  @override
  String toString() {
    return 'TickFilters(minGrade: $minGrade, maxGrade: $maxGrade, minRating: $minRating, disableTopRope: $disableTopRope, disableSport: $disableSport, disableTrad: $disableTrad)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TickFiltersImpl &&
            (identical(other.minGrade, minGrade) ||
                other.minGrade == minGrade) &&
            (identical(other.maxGrade, maxGrade) ||
                other.maxGrade == maxGrade) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.disableTopRope, disableTopRope) ||
                other.disableTopRope == disableTopRope) &&
            (identical(other.disableSport, disableSport) ||
                other.disableSport == disableSport) &&
            (identical(other.disableTrad, disableTrad) ||
                other.disableTrad == disableTrad));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minGrade, maxGrade, minRating,
      disableTopRope, disableSport, disableTrad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TickFiltersImplCopyWith<_$TickFiltersImpl> get copyWith =>
      __$$TickFiltersImplCopyWithImpl<_$TickFiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TickFiltersImplToJson(
      this,
    );
  }
}

abstract class _TickFilters extends TickFilters {
  factory _TickFilters(
      {final String minGrade,
      final String maxGrade,
      final double minRating,
      final bool disableTopRope,
      final bool disableSport,
      final bool disableTrad}) = _$TickFiltersImpl;
  _TickFilters._() : super._();

  factory _TickFilters.fromJson(Map<String, dynamic> json) =
      _$TickFiltersImpl.fromJson;

  @override
  String get minGrade;
  @override
  String get maxGrade;
  @override
  double get minRating;
  @override
  bool get disableTopRope;
  @override
  bool get disableSport;
  @override
  bool get disableTrad;
  @override
  @JsonKey(ignore: true)
  _$$TickFiltersImplCopyWith<_$TickFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
