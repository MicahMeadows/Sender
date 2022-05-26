part of 'navigation_cubit.dart';

@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState.home() = _home;
  const factory NavigationState.profile() = _profile;
  const factory NavigationState.settings() = _settings;
  const factory NavigationState.todo() = _todo;
  const factory NavigationState.error(String errorMessage) = _error;
}
