// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
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
    TResult Function(_authenticated value)? authenticated,
    TResult Function(_unauthenticated value)? unauthenticated,
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
      _$FirebaseAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirebaseAuthStateCopyWithImpl<$Res>
    implements $FirebaseAuthStateCopyWith<$Res> {
  _$FirebaseAuthStateCopyWithImpl(this._value, this._then);

  final FirebaseAuthState _value;
  // ignore: unused_field
  final $Res Function(FirebaseAuthState) _then;
}

/// @nodoc
abstract class _$$_authenticatedCopyWith<$Res> {
  factory _$$_authenticatedCopyWith(
          _$_authenticated value, $Res Function(_$_authenticated) then) =
      __$$_authenticatedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$$_authenticatedCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res>
    implements _$$_authenticatedCopyWith<$Res> {
  __$$_authenticatedCopyWithImpl(
      _$_authenticated _value, $Res Function(_$_authenticated) _then)
      : super(_value, (v) => _then(v as _$_authenticated));

  @override
  _$_authenticated get _value => super._value as _$_authenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_authenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_authenticated implements _authenticated {
  const _$_authenticated(this.user);

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
            other is _$_authenticated &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_authenticatedCopyWith<_$_authenticated> get copyWith =>
      __$$_authenticatedCopyWithImpl<_$_authenticated>(this, _$identity);

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
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
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
    TResult Function(_authenticated value)? authenticated,
    TResult Function(_unauthenticated value)? unauthenticated,
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
  const factory _authenticated(final User user) = _$_authenticated;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_authenticatedCopyWith<_$_authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_unauthenticatedCopyWith<$Res> {
  factory _$$_unauthenticatedCopyWith(
          _$_unauthenticated value, $Res Function(_$_unauthenticated) then) =
      __$$_unauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_unauthenticatedCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res>
    implements _$$_unauthenticatedCopyWith<$Res> {
  __$$_unauthenticatedCopyWithImpl(
      _$_unauthenticated _value, $Res Function(_$_unauthenticated) _then)
      : super(_value, (v) => _then(v as _$_unauthenticated));

  @override
  _$_unauthenticated get _value => super._value as _$_unauthenticated;
}

/// @nodoc

class _$_unauthenticated implements _unauthenticated {
  const _$_unauthenticated();

  @override
  String toString() {
    return 'FirebaseAuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_unauthenticated);
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
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
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
    TResult Function(_authenticated value)? authenticated,
    TResult Function(_unauthenticated value)? unauthenticated,
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
  const factory _unauthenticated() = _$_unauthenticated;
}
