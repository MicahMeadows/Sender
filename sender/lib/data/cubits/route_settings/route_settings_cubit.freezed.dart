// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouteSettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RouteSettings settings) settingsLoaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_settingsLoading value) settingsLoading,
    required TResult Function(_settingsLoaded value) settingsLoaded,
    required TResult Function(_error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteSettingsStateCopyWith<$Res> {
  factory $RouteSettingsStateCopyWith(
          RouteSettingsState value, $Res Function(RouteSettingsState) then) =
      _$RouteSettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteSettingsStateCopyWithImpl<$Res>
    implements $RouteSettingsStateCopyWith<$Res> {
  _$RouteSettingsStateCopyWithImpl(this._value, this._then);

  final RouteSettingsState _value;
  // ignore: unused_field
  final $Res Function(RouteSettingsState) _then;
}

/// @nodoc
abstract class _$$_settingsLoadingCopyWith<$Res> {
  factory _$$_settingsLoadingCopyWith(
          _$_settingsLoading value, $Res Function(_$_settingsLoading) then) =
      __$$_settingsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_settingsLoadingCopyWithImpl<$Res>
    extends _$RouteSettingsStateCopyWithImpl<$Res>
    implements _$$_settingsLoadingCopyWith<$Res> {
  __$$_settingsLoadingCopyWithImpl(
      _$_settingsLoading _value, $Res Function(_$_settingsLoading) _then)
      : super(_value, (v) => _then(v as _$_settingsLoading));

  @override
  _$_settingsLoading get _value => super._value as _$_settingsLoading;
}

/// @nodoc

class _$_settingsLoading implements _settingsLoading {
  const _$_settingsLoading();

  @override
  String toString() {
    return 'RouteSettingsState.settingsLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_settingsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RouteSettings settings) settingsLoaded,
    required TResult Function() error,
  }) {
    return settingsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
  }) {
    return settingsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (settingsLoading != null) {
      return settingsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_settingsLoading value) settingsLoading,
    required TResult Function(_settingsLoaded value) settingsLoaded,
    required TResult Function(_error value) error,
  }) {
    return settingsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
  }) {
    return settingsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) {
    if (settingsLoading != null) {
      return settingsLoading(this);
    }
    return orElse();
  }
}

abstract class _settingsLoading implements RouteSettingsState {
  const factory _settingsLoading() = _$_settingsLoading;
}

/// @nodoc
abstract class _$$_settingsLoadedCopyWith<$Res> {
  factory _$$_settingsLoadedCopyWith(
          _$_settingsLoaded value, $Res Function(_$_settingsLoaded) then) =
      __$$_settingsLoadedCopyWithImpl<$Res>;
  $Res call({RouteSettings settings});

  $RouteSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_settingsLoadedCopyWithImpl<$Res>
    extends _$RouteSettingsStateCopyWithImpl<$Res>
    implements _$$_settingsLoadedCopyWith<$Res> {
  __$$_settingsLoadedCopyWithImpl(
      _$_settingsLoaded _value, $Res Function(_$_settingsLoaded) _then)
      : super(_value, (v) => _then(v as _$_settingsLoaded));

  @override
  _$_settingsLoaded get _value => super._value as _$_settingsLoaded;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_$_settingsLoaded(
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as RouteSettings,
    ));
  }

  @override
  $RouteSettingsCopyWith<$Res> get settings {
    return $RouteSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$_settingsLoaded implements _settingsLoaded {
  const _$_settingsLoaded({required this.settings});

  @override
  final RouteSettings settings;

  @override
  String toString() {
    return 'RouteSettingsState.settingsLoaded(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_settingsLoaded &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$$_settingsLoadedCopyWith<_$_settingsLoaded> get copyWith =>
      __$$_settingsLoadedCopyWithImpl<_$_settingsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RouteSettings settings) settingsLoaded,
    required TResult Function() error,
  }) {
    return settingsLoaded(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
  }) {
    return settingsLoaded?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (settingsLoaded != null) {
      return settingsLoaded(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_settingsLoading value) settingsLoading,
    required TResult Function(_settingsLoaded value) settingsLoaded,
    required TResult Function(_error value) error,
  }) {
    return settingsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
  }) {
    return settingsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) {
    if (settingsLoaded != null) {
      return settingsLoaded(this);
    }
    return orElse();
  }
}

abstract class _settingsLoaded implements RouteSettingsState {
  const factory _settingsLoaded({required final RouteSettings settings}) =
      _$_settingsLoaded;

  RouteSettings get settings => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_settingsLoadedCopyWith<_$_settingsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_errorCopyWith<$Res> {
  factory _$$_errorCopyWith(_$_error value, $Res Function(_$_error) then) =
      __$$_errorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_errorCopyWithImpl<$Res>
    extends _$RouteSettingsStateCopyWithImpl<$Res>
    implements _$$_errorCopyWith<$Res> {
  __$$_errorCopyWithImpl(_$_error _value, $Res Function(_$_error) _then)
      : super(_value, (v) => _then(v as _$_error));

  @override
  _$_error get _value => super._value as _$_error;
}

/// @nodoc

class _$_error implements _error {
  const _$_error();

  @override
  String toString() {
    return 'RouteSettingsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RouteSettings settings) settingsLoaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RouteSettings settings)? settingsLoaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_settingsLoading value) settingsLoading,
    required TResult Function(_settingsLoaded value) settingsLoaded,
    required TResult Function(_error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_settingsLoading value)? settingsLoading,
    TResult Function(_settingsLoaded value)? settingsLoaded,
    TResult Function(_error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error implements RouteSettingsState {
  const factory _error() = _$_error;
}
