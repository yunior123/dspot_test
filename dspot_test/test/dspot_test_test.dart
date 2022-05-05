import 'package:dspot_test/dspot_test.dart';
import 'package:test/test.dart';

void main() {
  test(
    'calculate',
    () {
      final testArray0 = [
        [11, 2, 4],
        [4, 5, 6],
        [10, 8, -12]
      ];

      final testArray1 = [
        [1, 2, 3],
        [4, 5, 6],
        [9, 8, 9]
      ];
      final testArray2 = [
        [1, 2, 3],
        [4, 5, 6],
        [9, 8, 8]
      ];
      final testArray3 = [
        [1, 2, 3, 5],
        [4, 5, 6, 7],
        [9, 8, 9, 1],
        [2, 3, 4, 5],
      ];
      final expectedResult1 = [15, 2, 3, 1];
      var i = 0;
      for (final testArray in [
        testArray0,
        testArray1,
        testArray2,
        testArray3
      ]) {
        final result = diagonalDifference(testArray);
        print(result);
        expect(result, expectedResult1[i]);
        i++;
      }
    },
  );
}
