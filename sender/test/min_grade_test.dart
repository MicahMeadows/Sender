import 'package:flutter_test/flutter_test.dart';
import 'package:sender/common/helpers/climbing_route_helpers.dart';

void main() {
  group('Min climbing grade', () {
    test('first param lower second param', () {
      // Arrange
      final checks = {
        "5.8": ["5.9", "5.10b", "5.10c", "5.11a", "5.10d"],
        "5.9": ["5.9", "5.10b", "5.10c", "5.11a", "5.10d"],
        "5.10a": ["5.11b", "5.13b", "5.14c", "5.15a", "5.11c"],
        "5.10b": ["5.10c", "5.11b", "5.12c", "5.13a", "5.14d"],
        "5.11c": ["5.11d", "5.12c", "5.13c", "5.14b", "5.15a"],
        "5.11d": ["5.12a", "5.12b", "5.13c", "5.14a", "5.15d"],
        "5.12a": ["5.12b", "5.12c", "5.12c", "5.13a", "5.14d"],
        "5.12d": ["5.13a", "5.13b", "5.14c", "5.15a", "5.15d"],
        "5.14d": ["5.15a", "5.15b", "5.15c", "5.15d"],
      };
      // Assert
      checks.forEach((lower, uppers) {
        uppers.forEach((upper) {
          final result = minClimbingGrade(lower, upper);
          expect(result, lower);
        });
      });
    });
  });
}
