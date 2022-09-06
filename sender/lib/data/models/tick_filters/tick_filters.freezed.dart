// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TickFiltersCopyWithImpl<$Res>;
  $Res call(
      {String minGrade,
      String maxGrade,
      double minRating,
      bool disableTopRope,
      bool disableSport,
      bool disableTrad});
}

/// @nodoc
class _$TickFiltersCopyWithImpl<$Res> implements $TickFiltersCopyWith<$Res> {
  _$TickFiltersCopyWithImpl(this._value, this._then);

  final TickFilters _value;
  // ignore: unused_field
  final $Res Function(TickFilters) _then;

  @override
  $Res call({
    Object? minGrade = freezed,
    Object? maxGrade = freezed,
    Object? minRating = freezed,
    Object? disableTopRope = freezed,
    Object? disableSport = freezed,
    Object? disableTrad = freezed,
  }) {
    return _then(_value.copyWith(
      minGrade: minGrade == freezed
          ? _value.minGrade
          : minGrade // ignore: cast_nullable_to_non_nullable
              as String,
      maxGrade: maxGrade == freezed
          ? _value.maxGrade
          : maxGrade // ignore: cast_nullable_to_non_nullable
              as String,
      minRating: minRating == freezed
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      disableTopRope: disableTopRope == freezed
          ? _value.disableTopRope
          : disableTopRope // ignore: cast_nullable_to_non_nullable
              as bool,
      disableSport: disableSport == freezed
          ? _value.disableSport
          : disableSport // ignore: cast_nullable_to_non_nullable
              as bool,
      disableTrad: disableTrad == freezed
          ? _value.disableTrad
          : disableTrad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TickFiltersCopyWith<$Res>
    implements $TickFiltersCopyWith<$Res> {
  factory _$$_TickFiltersCopyWith(
          _$_TickFilters value, $Res Function(_$_TickFilters) then) =
      __$$_TickFiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String minGrade,
      String maxGrade,
      double minRating,
      bool disableTopRope,
      bool disableSport,
      bool disableTrad});
}

/// @nodoc
class __$$_TickFiltersCopyWithImpl<$Res> extends _$TickFiltersCopyWithImpl<$Res>
    implements _$$_TickFiltersCopyWith<$Res> {
  __$$_TickFiltersCopyWithImpl(
      _$_TickFilters _value, $Res Function(_$_TickFilters) _then)
      : super(_value, (v) => _then(v as _$_TickFilters));

  @override
  _$_TickFilters get _value => super._value as _$_TickFilters;

  @override
  $Res call({
    Object? minGrade = freezed,
    Object? maxGrade = freezed,
    Object? minRating = freezed,
    Object? disableTopRope = freezed,
    Object? disableSport = freezed,
    Object? disableTrad = freezed,
  }) {
    return _then(_$_TickFilters(
      minGrade: minGrade == freezed
          ? _value.minGrade
          : minGrade // ignore: cast_nullable_to_non_nullable
              as String,
      maxGrade: maxGrade == freezed
          ? _value.maxGrade
          : maxGrade // ignore: cast_nullable_to_non_nullable
              as String,
      minRating: minRating == freezed
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      disableTopRope: disableTopRope == freezed
          ? _value.disableTopRope
          : disableTopRope // ignore: cast_nullable_to_non_nullable
              as bool,
      disableSport: disableSport == freezed
          ? _value.disableSport
          : disableSport // ignore: cast_nullable_to_non_nullable
              as bool,
      disableTrad: disableTrad == freezed
          ? _value.disableTrad
          : disableTrad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TickFilters extends _TickFilters {
  _$_TickFilters(
      {this.minGrade = '5.0',
      this.maxGrade = '5.15d',
      this.minRating = 0,
      this.disableTopRope = false,
      this.disableSport = false,
      this.disableTrad = false})
      : super._();

  factory _$_TickFilters.fromJson(Map<String, dynamic> json) =>
      _$$_TickFiltersFromJson(json);

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
            other is _$_TickFilters &&
            const DeepCollectionEquality().equals(other.minGrade, minGrade) &&
            const DeepCollectionEquality().equals(other.maxGrade, maxGrade) &&
            const DeepCollectionEquality().equals(other.minRating, minRating) &&
            const DeepCollectionEquality()
                .equals(other.disableTopRope, disableTopRope) &&
            const DeepCollectionEquality()
                .equals(other.disableSport, disableSport) &&
            const DeepCollectionEquality()
                .equals(other.disableTrad, disableTrad));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(minGrade),
      const DeepCollectionEquality().hash(maxGrade),
      const DeepCollectionEquality().hash(minRating),
      const DeepCollectionEquality().hash(disableTopRope),
      const DeepCollectionEquality().hash(disableSport),
      const DeepCollectionEquality().hash(disableTrad));

  @JsonKey(ignore: true)
  @override
  _$$_TickFiltersCopyWith<_$_TickFilters> get copyWith =>
      __$$_TickFiltersCopyWithImpl<_$_TickFilters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TickFiltersToJson(
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
      final bool disableTrad}) = _$_TickFilters;
  _TickFilters._() : super._();

  factory _TickFilters.fromJson(Map<String, dynamic> json) =
      _$_TickFilters.fromJson;

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
  _$$_TickFiltersCopyWith<_$_TickFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
