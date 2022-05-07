List<int> compareTriplets(final List<int> a, final List<int> b) {
  var i = 0;
  var j = 0;

  final result = <int>[0, 0];

  while (i < a.length && j < b.length) {
    if (a[i] == b[j]) {
      i++;
      j++;
      continue;
    }
    if (a[i] > b[j]) {
      result[0]++;
    } else {
      result[1]++;
    }
    i++;
    j++;
  }
  return result;
}
