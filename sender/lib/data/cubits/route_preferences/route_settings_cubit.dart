import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

part 'route_settings_state.dart';
part 'route_settings_cubit.freezed.dart';

class RouteSettingsCubit extends Cubit<RouteSettingsState> {
  final IUserRepository userRepository;

  RouteSettingsCubit({required this.userRepository})
      : super(const RouteSettingsState.settingsLoading()) {
    loadSavedPreferences();
  }

  void setPreferences(RoutePreferences newPreferences) {
    emit(RouteSettingsState.settingsLoaded(settings: newPreferences));
  }

  void loadSavedPreferences() async {
    emit(const RouteSettingsState.settingsLoading());
    try {
      var loadedPreferences = await userRepository.getRoutePreferences();
      emit(RouteSettingsState.settingsLoaded(settings: loadedPreferences));
    } catch (ex) {
      emit(RouteSettingsState.error(ex.toString()));
    }
  }

  void uploadPreferences() async {
    state.whenOrNull(
      settingsLoaded: (settings) {
        userRepository.updateRoutePreferences(settings);
      },
    );
  }
}
