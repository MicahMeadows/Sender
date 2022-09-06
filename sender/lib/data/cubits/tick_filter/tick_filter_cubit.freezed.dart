// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tick_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TickFilterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(TickFilters filters) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(TickFilters filters)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(TickFilters filters)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_none value) none,
    required TResult Function(_set value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_none value)? none,
    TResult Function(_set value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_none value)? none,
    TResult Function(_set value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TickFilterStateCopyWith<$Res> {
  factory $TickFilterStateCopyWith(
          TickFilterState value, $Res Function(TickFilterState) then) =
      _$TickFilterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TickFilterStateCopyWithImpl<$Res>
    implements $TickFilterStateCopyWith<$Res> {
  _$TickFilterStateCopyWithImpl(this._value, this._then);

  final TickFilterState _value;
  // ignore: unused_field
  final $Res Function(TickFilterState) _then;
}

/// @nodoc
abstract class _$$_noneCopyWith<$Res> {
  factory _$$_noneCopyWith(_$_none value, $Res Function(_$_none) then) =
      __$$_noneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_noneCopyWithImpl<$Res> extends _$TickFilterStateCopyWithImpl<$Res>
    implements _$$_noneCopyWith<$Res> {
  __$$_noneCopyWithImpl(_$_none _value, $Res Function(_$_none) _then)
      : super(_value, (v) => _then(v as _$_none));

  @override
  _$_none get _value => super._value as _$_none;
}

/// @nodoc

class _$_none implements _none {
  const _$_none();

  @override
  String toString() {
    return 'TickFilterState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_none);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(TickFilters filters) set,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(TickFilters filters)? set,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(TickFilters filters)? set,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_none value) none,
    required TResult Function(_set value) set,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_none value)? none,
    TResult Function(_set value)? set,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_none value)? none,
    TResult Function(_set value)? set,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _none implements TickFilterState {
  const factory _none() = _$_none;
}

/// @nodoc
abstract class _$$_setCopyWith<$Res> {
  factory _$$_setCopyWith(_$_set value, $Res Function(_$_set) then) =
      __$$_setCopyWithImpl<$Res>;
  $Res call({TickFilters filters});

  $TickFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$_setCopyWithImpl<$Res> extends _$TickFilterStateCopyWithImpl<$Res>
    implements _$$_setCopyWith<$Res> {
  __$$_setCopyWithImpl(_$_set _value, $Res Function(_$_set) _then)
      : super(_value, (v) => _then(v as _$_set));

  @override
  _$_set get _value => super._value as _$_set;

  @override
  $Res call({
    Object? filters = freezed,
  }) {
    return _then(_$_set(
      filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as TickFilters,
    ));
  }

  @override
  $TickFiltersCopyWith<$Res> get filters {
    return $TickFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc

class _$_set implements _set {
  const _$_set(this.filters);

  @override
  final TickFilters filters;

  @override
  String toString() {
    return 'TickFilterState.set(filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_set &&
            const DeepCollectionEquality().equals(other.filters, filters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(filters));

  @JsonKey(ignore: true)
  @override
  _$$_setCopyWith<_$_set> get copyWith =>
      __$$_setCopyWithImpl<_$_set>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(TickFilters filters) set,
  }) {
    return set(filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(TickFilters filters)? set,
  }) {
    return set?.call(filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(TickFilters filters)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_none value) none,
    required TResult Function(_set value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_none value)? none,
    TResult Function(_set value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_none value)? none,
    TResult Function(_set value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class _set implements TickFilterState {
  const factory _set(final TickFilters filters) = _$_set;

  TickFilters get filters;
  @JsonKey(ignore: true)
  _$$_setCopyWith<_$_set> get copyWith => throw _privateConstructorUsedError;
}
