import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/models/route_settings.dart';

part 'route_settings_state.dart';
part 'route_settings_cubit.freezed.dart';

class RouteSettingsCubit extends Cubit<RouteSettingsState> {
  RouteSettingsCubit() : super(const RouteSettingsState.settingsLoading()) {
    saveSettings(_routeSettings);
  }

  var _routeSettings = const RouteSettings(
    areaId: "105841134",
    minYds: "5.11a",
    maxYds: "5.12b",
    showTrad: true,
    showSport: true,
    showTopRope: true,
    ratingGroup: 2.8,
    pitchesGroup: 0,
    sort1: "area",
    sort2: "rating",
  );

  void saveSettings(RouteSettings newSettings) {
    emit(const RouteSettingsState.settingsLoading());
    _routeSettings = newSettings;
    emit(RouteSettingsState.settingsLoaded(settings: _routeSettings));
  }

  void clearSettings() {
    _routeSettings = const RouteSettings(
      areaId: '',
      minYds: '',
      maxYds: '',
      showTrad: false,
      showSport: false,
      showTopRope: false,
      ratingGroup: 0,
      pitchesGroup: 0,
      sort1: '',
      sort2: '',
    );
  }
}
