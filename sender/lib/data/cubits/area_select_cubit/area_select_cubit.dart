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

  void goBackArea() {
    state.whenOrNull(loaded: (selected, subAreas, isLeaf) {
      if (selected.level == null) return;
      if (selected.level! == 0) return;
      final parentArea = subAreas
          .firstWhere((element) => element.level == selected.level! - 1);

      setSelectedArea(parentArea);
    });
  }

  void setSelectedArea(Area newArea) {
    state.maybeWhen(
      loaded: ((selectedArea, subAreas, leaf) {
        if (leaf) {
          emit(AreaSelectState.loaded(selectedArea, subAreas, true));
        } else {
          _loadSubAreas(newArea);
        }
      }),
      orElse: () {
        _loadSubAreas(newArea);
      },
    );
  }
}
