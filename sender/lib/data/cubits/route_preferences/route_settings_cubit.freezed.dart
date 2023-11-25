// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(RoutePreferences settings) settingsLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? settingsLoading,
    TResult? Function(RoutePreferences settings)? settingsLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RoutePreferences settings)? settingsLoaded,
    TResult Function(String message)? error,
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
    TResult? Function(_settingsLoading value)? settingsLoading,
    TResult? Function(_settingsLoaded value)? settingsLoaded,
    TResult? Function(_error value)? error,
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
      _$RouteSettingsStateCopyWithImpl<$Res, RouteSettingsState>;
}

/// @nodoc
class _$RouteSettingsStateCopyWithImpl<$Res, $Val extends RouteSettingsState>
    implements $RouteSettingsStateCopyWith<$Res> {
  _$RouteSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$settingsLoadingImplCopyWith<$Res> {
  factory _$$settingsLoadingImplCopyWith(_$settingsLoadingImpl value,
          $Res Function(_$settingsLoadingImpl) then) =
      __$$settingsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$settingsLoadingImplCopyWithImpl<$Res>
    extends _$RouteSettingsStateCopyWithImpl<$Res, _$settingsLoadingImpl>
    implements _$$settingsLoadingImplCopyWith<$Res> {
  __$$settingsLoadingImplCopyWithImpl(
      _$settingsLoadingImpl _value, $Res Function(_$settingsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$settingsLoadingImpl implements _settingsLoading {
  const _$settingsLoadingImpl();

  @override
  String toString() {
    return 'RouteSettingsState.settingsLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$settingsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RoutePreferences settings) settingsLoaded,
    required TResult Function(String message) error,
  }) {
    return settingsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? settingsLoading,
    TResult? Function(RoutePreferences settings)? settingsLoaded,
    TResult? Function(String message)? error,
  }) {
    return settingsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RoutePreferences settings)? settingsLoaded,
    TResult Function(String message)? error,
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
    TResult? Function(_settingsLoading value)? settingsLoading,
    TResult? Function(_settingsLoaded value)? settingsLoaded,
    TResult? Function(_error value)? error,
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
  const factory _settingsLoading() = _$settingsLoadingImpl;
}

/// @nodoc
abstract class _$$settingsLoadedImplCopyWith<$Res> {
  factory _$$settingsLoadedImplCopyWith(_$settingsLoadedImpl value,
          $Res Function(_$settingsLoadedImpl) then) =
      __$$settingsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoutePreferences settings});

  $RoutePreferencesCopyWith<$Res> get settings;
}

/// @nodoc
class __$$settingsLoadedImplCopyWithImpl<$Res>
    extends _$RouteSettingsStateCopyWithImpl<$Res, _$settingsLoadedImpl>
    implements _$$settingsLoadedImplCopyWith<$Res> {
  __$$settingsLoadedImplCopyWithImpl(
      _$settingsLoadedImpl _value, $Res Function(_$settingsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_$settingsLoadedImpl(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as RoutePreferences,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RoutePreferencesCopyWith<$Res> get settings {
    return $RoutePreferencesCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$settingsLoadedImpl implements _settingsLoaded {
  const _$settingsLoadedImpl({required this.settings});

  @override
  final RoutePreferences settings;

  @override
  String toString() {
    return 'RouteSettingsState.settingsLoaded(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$settingsLoadedImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$settingsLoadedImplCopyWith<_$settingsLoadedImpl> get copyWith =>
      __$$settingsLoadedImplCopyWithImpl<_$settingsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RoutePreferences settings) settingsLoaded,
    required TResult Function(String message) error,
  }) {
    return settingsLoaded(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? settingsLoading,
    TResult? Function(RoutePreferences settings)? settingsLoaded,
    TResult? Function(String message)? error,
  }) {
    return settingsLoaded?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RoutePreferences settings)? settingsLoaded,
    TResult Function(String message)? error,
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
    TResult? Function(_settingsLoading value)? settingsLoading,
    TResult? Function(_settingsLoaded value)? settingsLoaded,
    TResult? Function(_error value)? error,
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
  const factory _settingsLoaded({required final RoutePreferences settings}) =
      _$settingsLoadedImpl;

  RoutePreferences get settings;
  @JsonKey(ignore: true)
  _$$settingsLoadedImplCopyWith<_$settingsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorImplCopyWith<$Res> {
  factory _$$errorImplCopyWith(
          _$errorImpl value, $Res Function(_$errorImpl) then) =
      __$$errorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$errorImplCopyWithImpl<$Res>
    extends _$RouteSettingsStateCopyWithImpl<$Res, _$errorImpl>
    implements _$$errorImplCopyWith<$Res> {
  __$$errorImplCopyWithImpl(
      _$errorImpl _value, $Res Function(_$errorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$errorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$errorImpl implements _error {
  const _$errorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RouteSettingsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$errorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$errorImplCopyWith<_$errorImpl> get copyWith =>
      __$$errorImplCopyWithImpl<_$errorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() settingsLoading,
    required TResult Function(RoutePreferences settings) settingsLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? settingsLoading,
    TResult? Function(RoutePreferences settings)? settingsLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? settingsLoading,
    TResult Function(RoutePreferences settings)? settingsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
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
    TResult? Function(_settingsLoading value)? settingsLoading,
    TResult? Function(_settingsLoaded value)? settingsLoaded,
    TResult? Function(_error value)? error,
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
  const factory _error(final String message) = _$errorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$errorImplCopyWith<_$errorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
