import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:sender/data/models/tick_filters/tick_filters.dart';

part 'tick_filter_cubit.freezed.dart';
part 'tick_filter_state.dart';

class TickFilterCubit extends Cubit<TickFilterState> {
  TickFilterCubit() : super(const TickFilterState.none());

  void clearFilters() {
    emit(const TickFilterState.none());
  }

  void setFilters(TickFilters newFilters) {
    emit(TickFilterState.set(newFilters));
  }
}
