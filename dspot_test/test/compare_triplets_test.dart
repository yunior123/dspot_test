import 'package:dspot_test/compare_triplets.dart';
import 'package:test/test.dart';

void main() {
  test(
    'compare triplets ...',
    () async {
      final testArray0 = [17, 28, 30];
      final testArray1 = [99, 16, 8];

      final testArray2 = [5, 6, 7];
      final testArray3 = [3, 6, 10];

      final testResults = [
        [2, 1],
        [1, 1]
      ];

      var i = 0;
      for (final pairArray in [
        [
          testArray0,
          testArray1,
        ],
        [
          testArray2,
          testArray3,
        ]
      ]) {
        final result = compareTriplets(pairArray[0], pairArray[1]);
        expect(result, testResults[i]);
        i++;
      }
    },
  );
}
