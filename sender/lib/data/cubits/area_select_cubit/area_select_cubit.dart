import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';
import 'package:sender/data/models/area/area.dart';

part 'area_select_state.dart';
part 'area_select_cubit.freezed.dart';

class AreaSelectCubit extends Cubit<AreaSelectState> {
  final IAreaRepository _areaRepository;

  AreaSelectCubit(this._areaRepository)
      : super(const AreaSelectState.loading()) {
    _loadSubAreas(const Area(id: "0", name: "All Locations"));
  }

  void _loadSubAreas(Area parentArea) async {
    emit(const AreaSelectState.loading());
    try {
      var newAreas = await _areaRepository.getAreas(parentArea.id);
      emit(AreaSelectState.loaded(parentArea, newAreas));
    } catch (ex) {
      emit(AreaSelectState.error(ex.toString()));
    }
  }

  void setSelectedArea(Area newArea) {
    state.maybeWhen(
      loaded: ((selectedarea, subareas) {
        if (subareas.contains(selectedarea)) {
          _loadSubAreas(selectedarea);
        }
      }),
      orElse: () {
        _loadSubAreas(newArea);
      },
    );
  }
}