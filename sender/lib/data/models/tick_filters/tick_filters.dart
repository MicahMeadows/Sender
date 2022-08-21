import 'package:freezed_annotation/freezed_annotation.dart';

part 'tick_filters.freezed.dart';
part 'tick_filters.g.dart';

@Freezed(toJson: true, fromJson: true)
class TickFilters with _$TickFilters {
  factory TickFilters({
    String? minGrade,
    String? maxGrade,
    double? minRating,
    String? type,
  }) = _TickFilters;
}
