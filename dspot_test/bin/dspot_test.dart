import 'package:dspot_test/dspot_test.dart' as dspot_test;

void main(List<String> arguments) {
  final testArray1 = [
    [3],
    [1, 2, 3],
    [4, 5, 6],
    [9, 8, 9]
  ];
  final testArray2 = [
    [3],
    [1, 2, 3],
    [4, 5, 6],
    [9, 8, 9]
  ];
  final testArray3 = [
    [4],
    [1, 2, 3, 5],
    [4, 5, 6, 7],
    [9, 8, 9, 1],
    [2, 3, 4, 5],
  ];
  for (var testArray in [testArray1, testArray2, testArray3]) {
    final result = dspot_test.diagonalDifference(testArray);
    print('result: $result');
  }
}
