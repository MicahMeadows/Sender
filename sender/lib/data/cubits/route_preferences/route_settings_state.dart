part of 'route_settings_cubit.dart';

@freezed
class RouteSettingsState with _$RouteSettingsState {
  const factory RouteSettingsState.settingsLoading() = _settingsLoading;

  const factory RouteSettingsState.settingsLoaded({
    required RoutePreferences settings,
  }) = _settingsLoaded;

  const factory RouteSettingsState.error(String message) = _error;
}
