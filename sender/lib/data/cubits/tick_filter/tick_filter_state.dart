part of 'tick_filter_cubit.dart';

@freezed
class TickFilterState with _$TickFilterState {
  const factory TickFilterState.none() = _none;
  const factory TickFilterState.set(TickFilters filters) = _set;
}
