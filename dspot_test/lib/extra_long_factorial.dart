void extraLongFactorials(final int n) {
  final result = recursiveExtraLongFactorials(n);
  print(result);
}

int recursiveExtraLongFactorials(final int n) {
  if (n == 1) {
    return 1;
  }
  return n * recursiveExtraLongFactorials(n - 1);
}
