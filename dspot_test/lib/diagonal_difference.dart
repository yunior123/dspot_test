/// [[3], [4,8,9], [5,6,7], [1,2,4]]
int diagonalDifference(final List<List<int>> arr) {
  if (arr.isEmpty) {
    return 0;
  }
  // 3
  final arrLength = arr.first.length;
  var sum1 = 0;
  var sum2 = 0;
  for (var i = 0; i < arr.length; i++) {
    // first iteration should be [4,8,9]
    // second iteration should be [5,6,7]
    // third iteration should be [1,2,4]
    final row = arr[i];
    // 4
    // 6
    // 4
    sum1 += row[i];
    // 9
    // 6
    // 1
    sum2 += row[arrLength - i - 1];
  }
  return (sum1 - sum2).abs();
}
