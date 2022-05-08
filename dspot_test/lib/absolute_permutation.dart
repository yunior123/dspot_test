// |pos[i]-i| = k
List<int> absolutePermutation(final int n, final int k) {
  if (n == 1) {
    return [1];
  }
  // [1,2,3,4,5]
  // [2,1,3,4,5]
  // [3,2,1,4,5]
  // [4,3,2,1,5]
  final result = List.generate(n, (final index) => 0);
  final listOfValues = List.generate(n, (final index) => index + 1);

  var i = 1;
  while (result.any((final element) => element == 0)) {
    final condition = (listOfValues[i - 1] - i).abs() == k;
    if (condition) {
      final value = listOfValues[i - 1];
      result[i - 1] = value;
      i++;
    } else {
      listOfValues.shuffle();
    }
  }

  return result;
}

// void recursiveAbsolutePermutation(
//   final List<int> permutationList,
//   final int k,
// ) {
//   if (permutationList
//       .every((final value) => permutationList[value] - value == k)) {
//     return;
//   }


//   return recursiveAbsolutePermutation(permutationList, k);
// }

// void permuteList(final List<int> list) {
//   final listOfValues = List.generate(list.length, (final index) => list[index]);


//   return permuteList(listOfValues);


// }
