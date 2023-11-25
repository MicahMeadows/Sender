// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function()? none,
    TResult? Function(TickFilters filters)? set,
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
    TResult? Function(_none value)? none,
    TResult? Function(_set value)? set,
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
      _$TickFilterStateCopyWithImpl<$Res, TickFilterState>;
}

/// @nodoc
class _$TickFilterStateCopyWithImpl<$Res, $Val extends TickFilterState>
    implements $TickFilterStateCopyWith<$Res> {
  _$TickFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$noneImplCopyWith<$Res> {
  factory _$$noneImplCopyWith(
          _$noneImpl value, $Res Function(_$noneImpl) then) =
      __$$noneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$noneImplCopyWithImpl<$Res>
    extends _$TickFilterStateCopyWithImpl<$Res, _$noneImpl>
    implements _$$noneImplCopyWith<$Res> {
  __$$noneImplCopyWithImpl(_$noneImpl _value, $Res Function(_$noneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$noneImpl implements _none {
  const _$noneImpl();

  @override
  String toString() {
    return 'TickFilterState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$noneImpl);
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
    TResult? Function()? none,
    TResult? Function(TickFilters filters)? set,
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
    TResult? Function(_none value)? none,
    TResult? Function(_set value)? set,
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
  const factory _none() = _$noneImpl;
}

/// @nodoc
abstract class _$$setImplCopyWith<$Res> {
  factory _$$setImplCopyWith(_$setImpl value, $Res Function(_$setImpl) then) =
      __$$setImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TickFilters filters});

  $TickFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$setImplCopyWithImpl<$Res>
    extends _$TickFilterStateCopyWithImpl<$Res, _$setImpl>
    implements _$$setImplCopyWith<$Res> {
  __$$setImplCopyWithImpl(_$setImpl _value, $Res Function(_$setImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
  }) {
    return _then(_$setImpl(
      null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as TickFilters,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TickFiltersCopyWith<$Res> get filters {
    return $TickFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc

class _$setImpl implements _set {
  const _$setImpl(this.filters);

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
            other is _$setImpl &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$setImplCopyWith<_$setImpl> get copyWith =>
      __$$setImplCopyWithImpl<_$setImpl>(this, _$identity);

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
    TResult? Function()? none,
    TResult? Function(TickFilters filters)? set,
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
    TResult? Function(_none value)? none,
    TResult? Function(_set value)? set,
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
  const factory _set(final TickFilters filters) = _$setImpl;

  TickFilters get filters;
  @JsonKey(ignore: true)
  _$$setImplCopyWith<_$setImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
