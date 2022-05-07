int simpleArraySum(final List<int> arr) {
  if (arr.isEmpty) {
    return 0;
  }
  return arr.reduce((final value, final element) => value + element);
}
