import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/data/models/tick_filters/tick_filters.dart';

import 'package:sender/common/helpers/climbing_route_helpers.dart';

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

  bool isDisabled(RouteTick tick, TickFilters filters) {
    final tickType = tick.routeType;
    if (filters.disableSport && tickType == 'sport') return true;
    if (filters.disableSport && tickType == 'trad') return true;
    if (filters.disableSport && tickType == 'top') return true;
    return false;
  }

  bool inGradeRange(RouteTick tick, TickFilters filters) {
    final minOfLower = minClimbingGrade(tick.grade, filters.minGrade);
    final minOfUpper = minClimbingGrade(tick.grade, filters.maxGrade);

    return minOfLower != tick.grade && minOfUpper == tick.grade;
  }

  bool aboveMinRating(RouteTick tick, TickFilters filters) {
    return tick.rating >= filters.minRating;
  }

  bool containsSearchString(RouteTick tick, String? search) {
    if (search == null) return true;

    if (search == '') return true;

    final searchStringFix = search.toLowerCase().trim();
    final areaNameFix = tick.area.toLowerCase().trim();
    final routeNameFix = tick.name.toLowerCase().trim();

    if (routeNameFix.contains(searchStringFix)) {
      return true;
    }
    if (areaNameFix.contains(searchStringFix)) {
      return true;
    }
    return false;
  }

  List<RouteTick> filterTicks(
    List<RouteTick> ticks,
    TickFilters? filters,
    String? search,
  ) {
    if (filters == null && search == null) return ticks;

    final searched = search == null
        ? ticks
        : ticks.where((element) => containsSearchString(element, search));

    final filtered = filters == null
        ? searched
        : searched
            .where((tick) =>
                !isDisabled(tick, filters) &&
                inGradeRange(tick, filters) &&
                aboveMinRating(tick, filters))
            .toList();

    return filtered.toList();
  }
}
