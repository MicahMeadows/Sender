// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)
        loaded,
    required TResult Function() loading,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loaded value) loaded,
    required TResult Function(_loading value) loading,
    required TResult Function(_error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  final TodoListState _value;
  // ignore: unused_field
  final $Res Function(TodoListState) _then;
}

/// @nodoc
abstract class _$$_loadedCopyWith<$Res> {
  factory _$$_loadedCopyWith(_$_loaded value, $Res Function(_$_loaded) then) =
      __$$_loadedCopyWithImpl<$Res>;
  $Res call(
      {List<RouteTick> sends,
      List<RouteTick> todos,
      List<RouteTick> skips,
      List<RouteTick> likes});
}

/// @nodoc
class __$$_loadedCopyWithImpl<$Res> extends _$TodoListStateCopyWithImpl<$Res>
    implements _$$_loadedCopyWith<$Res> {
  __$$_loadedCopyWithImpl(_$_loaded _value, $Res Function(_$_loaded) _then)
      : super(_value, (v) => _then(v as _$_loaded));

  @override
  _$_loaded get _value => super._value as _$_loaded;

  @override
  $Res call({
    Object? sends = freezed,
    Object? todos = freezed,
    Object? skips = freezed,
    Object? likes = freezed,
  }) {
    return _then(_$_loaded(
      sends: sends == freezed
          ? _value._sends
          : sends // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
      todos: todos == freezed
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
      skips: skips == freezed
          ? _value._skips
          : skips // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
      likes: likes == freezed
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
    ));
  }
}

/// @nodoc

class _$_loaded implements _loaded {
  const _$_loaded(
      {required final List<RouteTick> sends,
      required final List<RouteTick> todos,
      required final List<RouteTick> skips,
      required final List<RouteTick> likes})
      : _sends = sends,
        _todos = todos,
        _skips = skips,
        _likes = likes;

  final List<RouteTick> _sends;
  @override
  List<RouteTick> get sends {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sends);
  }

  final List<RouteTick> _todos;
  @override
  List<RouteTick> get todos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  final List<RouteTick> _skips;
  @override
  List<RouteTick> get skips {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skips);
  }

  final List<RouteTick> _likes;
  @override
  List<RouteTick> get likes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString() {
    return 'TodoListState.loaded(sends: $sends, todos: $todos, skips: $skips, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loaded &&
            const DeepCollectionEquality().equals(other._sends, _sends) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            const DeepCollectionEquality().equals(other._skips, _skips) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sends),
      const DeepCollectionEquality().hash(_todos),
      const DeepCollectionEquality().hash(_skips),
      const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  _$$_loadedCopyWith<_$_loaded> get copyWith =>
      __$$_loadedCopyWithImpl<_$_loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)
        loaded,
    required TResult Function() loading,
    required TResult Function(String errorMessage) error,
  }) {
    return loaded(sends, todos, skips, likes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
  }) {
    return loaded?.call(sends, todos, skips, likes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(sends, todos, skips, likes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loaded value) loaded,
    required TResult Function(_loading value) loading,
    required TResult Function(_error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loaded implements TodoListState {
  const factory _loaded(
      {required final List<RouteTick> sends,
      required final List<RouteTick> todos,
      required final List<RouteTick> skips,
      required final List<RouteTick> likes}) = _$_loaded;

  List<RouteTick> get sends;
  List<RouteTick> get todos;
  List<RouteTick> get skips;
  List<RouteTick> get likes;
  @JsonKey(ignore: true)
  _$$_loadedCopyWith<_$_loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_loadingCopyWith<$Res> {
  factory _$$_loadingCopyWith(
          _$_loading value, $Res Function(_$_loading) then) =
      __$$_loadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingCopyWithImpl<$Res> extends _$TodoListStateCopyWithImpl<$Res>
    implements _$$_loadingCopyWith<$Res> {
  __$$_loadingCopyWithImpl(_$_loading _value, $Res Function(_$_loading) _then)
      : super(_value, (v) => _then(v as _$_loading));

  @override
  _$_loading get _value => super._value as _$_loading;
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'TodoListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)
        loaded,
    required TResult Function() loading,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loaded value) loaded,
    required TResult Function(_loading value) loading,
    required TResult Function(_error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements TodoListState {
  const factory _loading() = _$_loading;
}

/// @nodoc
abstract class _$$_errorCopyWith<$Res> {
  factory _$$_errorCopyWith(_$_error value, $Res Function(_$_error) then) =
      __$$_errorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$$_errorCopyWithImpl<$Res> extends _$TodoListStateCopyWithImpl<$Res>
    implements _$$_errorCopyWith<$Res> {
  __$$_errorCopyWithImpl(_$_error _value, $Res Function(_$_error) _then)
      : super(_value, (v) => _then(v as _$_error));

  @override
  _$_error get _value => super._value as _$_error;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$_error(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_error implements _error {
  const _$_error({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'TodoListState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_error &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_errorCopyWith<_$_error> get copyWith =>
      __$$_errorCopyWithImpl<_$_error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)
        loaded,
    required TResult Function() loading,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult Function()? loading,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loaded value) loaded,
    required TResult Function(_loading value) loading,
    required TResult Function(_error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loaded value)? loaded,
    TResult Function(_loading value)? loading,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error implements TodoListState {
  const factory _error({required final String errorMessage}) = _$_error;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$_errorCopyWith<_$_error> get copyWith =>
      throw _privateConstructorUsedError;
}
