/*
[1,3,5,7,9]

maxArray = [3,5,7,9]
minArray = [1,3,5,7]
16 24
*/

void miniMaxSum(final List<int> arr) {
  if (arr.isEmpty) {
    return;
  }
  arr.sort();
  final maxArray = arr.sublist(1, arr.length);
  final minArray = arr.sublist(0, arr.length - 1);
  final sumMax =
      maxArray.reduce((final value, final element) => value + element);
  final sumMin =
      minArray.reduce((final value, final element) => value + element);
  print('$sumMin $sumMax');
}
