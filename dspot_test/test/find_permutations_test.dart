import 'package:dspot_test/find_permutations.dart';
import 'package:test/test.dart';

void main() {
  test(
    'find permutations ...',
    () async {
      final result = findPermutations(
        [
          1,
          2,
          3,
        ],
      );
      expect(
        result,
        [
          [1, 2, 3],
          [1, 3, 2],
          [2, 1, 3],
          [2, 3, 1],
          [3, 2, 1],
          [3, 1, 2],
        ],
      );
    },
  );
}
