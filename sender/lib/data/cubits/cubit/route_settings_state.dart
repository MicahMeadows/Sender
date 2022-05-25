part of 'route_settings_cubit.dart';

@freezed
class RouteSettingsState with _$RouteSettingsState {
  const factory RouteSettingsState.settingsLoading() = _settingsLoading;

  const factory RouteSettingsState.settingsLoaded({
    required RouteSettings settings,
  }) = _settingsLoaded;

  const factory RouteSettingsState.error() = _error;
}
