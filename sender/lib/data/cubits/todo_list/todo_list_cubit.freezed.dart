// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String errorMessage)? error,
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
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_loading value)? loading,
    TResult? Function(_error value)? error,
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
      _$TodoListStateCopyWithImpl<$Res, TodoListState>;
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res, $Val extends TodoListState>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$loadedImplCopyWith<$Res> {
  factory _$$loadedImplCopyWith(
          _$loadedImpl value, $Res Function(_$loadedImpl) then) =
      __$$loadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<RouteTick> sends,
      List<RouteTick> todos,
      List<RouteTick> skips,
      List<RouteTick> likes});
}

/// @nodoc
class __$$loadedImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$loadedImpl>
    implements _$$loadedImplCopyWith<$Res> {
  __$$loadedImplCopyWithImpl(
      _$loadedImpl _value, $Res Function(_$loadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sends = null,
    Object? todos = null,
    Object? skips = null,
    Object? likes = null,
  }) {
    return _then(_$loadedImpl(
      sends: null == sends
          ? _value._sends
          : sends // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
      skips: null == skips
          ? _value._skips
          : skips // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<RouteTick>,
    ));
  }
}

/// @nodoc

class _$loadedImpl implements _loaded {
  const _$loadedImpl(
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
    if (_sends is EqualUnmodifiableListView) return _sends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sends);
  }

  final List<RouteTick> _todos;
  @override
  List<RouteTick> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  final List<RouteTick> _skips;
  @override
  List<RouteTick> get skips {
    if (_skips is EqualUnmodifiableListView) return _skips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skips);
  }

  final List<RouteTick> _likes;
  @override
  List<RouteTick> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
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
            other is _$loadedImpl &&
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
  @pragma('vm:prefer-inline')
  _$$loadedImplCopyWith<_$loadedImpl> get copyWith =>
      __$$loadedImplCopyWithImpl<_$loadedImpl>(this, _$identity);

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
    TResult? Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String errorMessage)? error,
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
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_loading value)? loading,
    TResult? Function(_error value)? error,
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
      required final List<RouteTick> likes}) = _$loadedImpl;

  List<RouteTick> get sends;
  List<RouteTick> get todos;
  List<RouteTick> get skips;
  List<RouteTick> get likes;
  @JsonKey(ignore: true)
  _$$loadedImplCopyWith<_$loadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loadingImplCopyWith<$Res> {
  factory _$$loadingImplCopyWith(
          _$loadingImpl value, $Res Function(_$loadingImpl) then) =
      __$$loadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$loadingImpl>
    implements _$$loadingImplCopyWith<$Res> {
  __$$loadingImplCopyWithImpl(
      _$loadingImpl _value, $Res Function(_$loadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingImpl implements _loading {
  const _$loadingImpl();

  @override
  String toString() {
    return 'TodoListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingImpl);
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
    TResult? Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String errorMessage)? error,
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
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_loading value)? loading,
    TResult? Function(_error value)? error,
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
  const factory _loading() = _$loadingImpl;
}

/// @nodoc
abstract class _$$errorImplCopyWith<$Res> {
  factory _$$errorImplCopyWith(
          _$errorImpl value, $Res Function(_$errorImpl) then) =
      __$$errorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$errorImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$errorImpl>
    implements _$$errorImplCopyWith<$Res> {
  __$$errorImplCopyWithImpl(
      _$errorImpl _value, $Res Function(_$errorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$errorImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$errorImpl implements _error {
  const _$errorImpl({required this.errorMessage});

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
            other is _$errorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$errorImplCopyWith<_$errorImpl> get copyWith =>
      __$$errorImplCopyWithImpl<_$errorImpl>(this, _$identity);

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
    TResult? Function(List<RouteTick> sends, List<RouteTick> todos,
            List<RouteTick> skips, List<RouteTick> likes)?
        loaded,
    TResult? Function()? loading,
    TResult? Function(String errorMessage)? error,
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
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_loading value)? loading,
    TResult? Function(_error value)? error,
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
  const factory _error({required final String errorMessage}) = _$errorImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$errorImplCopyWith<_$errorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
