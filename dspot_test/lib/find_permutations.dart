List<List<int>> findPermutations(final List<int> values) {
  final result = <List<int>>[];

  permute(values, 0, result);

  return result;
}

// [1,2,3]
void permute(
  final List<int> list,
  final int start,
  final List<List<int>> result,
) {
  // [1,2,3]
  // [1,2,3]
  // [1,2,3]
  // [1,2,3]
  if (start == list.length) {
    result.add(list);
    return;
  }

  for (var i = start; i < list.length; i++) {
    final permutation = List<int>.from(list);
    permutation[start] = list[i];
    permutation[i] = list[start];
    // [1,2,3] i=0 start=0
    //----- [1,2,3] i=1 start=0
    // [1,2,3] i=1 start=1
    //----- [1,3,2] i=2 start=1
    //---------- [1,3,2] i=2 start=2
    // [1,2,3] i=2 start=2

    permute(permutation, start + 1, result);
  }
}
