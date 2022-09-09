part of 'area_select_cubit.dart';

@freezed
class AreaSelectState with _$AreaSelectState {
  const factory AreaSelectState.loading() = _loading;
  const factory AreaSelectState.loaded(Area selectedarea, List<Area> areas) =
      _loaded;
  const factory AreaSelectState.error(String message) = _error;
}
