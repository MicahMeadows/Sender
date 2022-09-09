import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sender/data/repository/area_repository/i_area_repository.dart';
import 'package:sender/data/models/area/area.dart';

part 'area_select_state.dart';
part 'area_select_cubit.freezed.dart';

class AreaSelectCubit extends Cubit<AreaSelectState> {
  final IAreaRepository _areaRepository;

  AreaSelectCubit(this._areaRepository, {required Area initialArea})
      : super(const AreaSelectState.loading()) {
    _loadSubAreas(initialArea);
  }

  void _loadSubAreas(Area parentArea) async {
    emit(const AreaSelectState.loading());
    try {
      var newAreas = await _areaRepository.getAreas(parentArea.id);

      if (newAreas.isEmpty) {}

      final subAreas = newAreas
          // .where(
          //   (area) => (area.level ?? 0) > (parentArea.level ?? 0),
          // )
          .toList();

      emit(AreaSelectState.loaded(parentArea, subAreas));
    } catch (ex) {
      emit(AreaSelectState.error(ex.toString()));
    }
  }

  void setSelectedArea(Area newArea) {
    state.maybeWhen(
      loaded: ((selectedArea, areas) {
        if (selectedArea != newArea) {
          _loadSubAreas(newArea);
        }
      }),
      orElse: () {
        _loadSubAreas(newArea);
      },
    );
  }
}
