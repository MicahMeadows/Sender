// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirebaseAuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_authenticated value) authenticated,
    required TResult Function(_unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_authenticated value)? authenticated,
    TResult? Function(_unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_authenticated value)? authenticated,
    TResult Function(_unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthStateCopyWith<$Res> {
  factory $FirebaseAuthStateCopyWith(
          FirebaseAuthState value, $Res Function(FirebaseAuthState) then) =
      _$FirebaseAuthStateCopyWithImpl<$Res, FirebaseAuthState>;
}

/// @nodoc
class _$FirebaseAuthStateCopyWithImpl<$Res, $Val extends FirebaseAuthState>
    implements $FirebaseAuthStateCopyWith<$Res> {
  _$FirebaseAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$authenticatedImplCopyWith<$Res> {
  factory _$$authenticatedImplCopyWith(
          _$authenticatedImpl value, $Res Function(_$authenticatedImpl) then) =
      __$$authenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$authenticatedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$authenticatedImpl>
    implements _$$authenticatedImplCopyWith<$Res> {
  __$$authenticatedImplCopyWithImpl(
      _$authenticatedImpl _value, $Res Function(_$authenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$authenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$authenticatedImpl implements _authenticated {
  const _$authenticatedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'FirebaseAuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$authenticatedImplCopyWith<_$authenticatedImpl> get copyWith =>
      __$$authenticatedImplCopyWithImpl<_$authenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_authenticated value) authenticated,
    required TResult Function(_unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_authenticated value)? authenticated,
    TResult? Function(_unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_authenticated value)? authenticated,
    TResult Function(_unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _authenticated implements FirebaseAuthState {
  const factory _authenticated(final User user) = _$authenticatedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$authenticatedImplCopyWith<_$authenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$unauthenticatedImplCopyWith<$Res> {
  factory _$$unauthenticatedImplCopyWith(_$unauthenticatedImpl value,
          $Res Function(_$unauthenticatedImpl) then) =
      __$$unauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$unauthenticatedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$unauthenticatedImpl>
    implements _$$unauthenticatedImplCopyWith<$Res> {
  __$$unauthenticatedImplCopyWithImpl(
      _$unauthenticatedImpl _value, $Res Function(_$unauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$unauthenticatedImpl implements _unauthenticated {
  const _$unauthenticatedImpl();

  @override
  String toString() {
    return 'FirebaseAuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$unauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_authenticated value) authenticated,
    required TResult Function(_unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_authenticated value)? authenticated,
    TResult? Function(_unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_authenticated value)? authenticated,
    TResult Function(_unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _unauthenticated implements FirebaseAuthState {
  const factory _unauthenticated() = _$unauthenticatedImpl;
}
