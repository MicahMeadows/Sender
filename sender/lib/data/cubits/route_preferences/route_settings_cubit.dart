import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';
import 'package:sender/data/repository/user_repository/i_user_repository.dart';

import '../area_select_cubit/area_select_cubit.dart';

part 'route_settings_state.dart';
part 'route_settings_cubit.freezed.dart';

class RouteSettingsCubit extends Cubit<RouteSettingsState> {
  final IUserRepository userRepository;
  final IAreaRepository areaRepository;

  RouteSettingsCubit({
    required this.userRepository,
    required this.areaRepository,
  }) : super(const RouteSettingsState.settingsLoading()) {
    loadSavedPreferences();
  }

  // AreaSelectCubit createAreaSelectCubit() {
  //   if (state is! _settingsLoaded) {
  //     throw Exception('Cannot create area selector no settings loaded');
  //   }

  //   final loadedState = state as _settingsLoaded;

  //   final loadedSettings = loadedState.settings;

  //   final newCubit = AreaSelectCubit(
  //     areaRepository,
  //     initialArea: loadedSettings.area,
  //   );

  //   newCubit.setSelectedArea(loadedSettings.area);
  //   return newCubit;
  // }

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
