import 'package:freezed_annotation/freezed_annotation.dart';

part 'tick_filters.freezed.dart';
part 'tick_filters.g.dart';

@Freezed(toJson: true, fromJson: true)
class TickFilters with _$TickFilters {
  const TickFilters._();

  factory TickFilters({
    @Default('5.0') String minGrade,
    @Default('5.15d') String maxGrade,
    @Default(0) double minRating,
    @Default(true) bool enableTopRope,
    @Default(true) bool enableSport,
    @Default(true) bool enableTrad,
  }) = _TickFilters;

  int get numFilters {
    int cnt = 0;
    if (minGrade != '5.0' || maxGrade != '5.15d') cnt++;
    if (minRating != 0) cnt++;
    if (!enableSport || !enableTopRope || !enableTrad) cnt++;
    return cnt;
  }
}
