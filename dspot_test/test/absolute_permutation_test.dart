import 'package:dspot_test/absolute_permutation.dart';
import 'package:test/test.dart';

void main() {
  test(
    'absolute permutation ...',
    () async {
      final result = absolutePermutation(4, 2);
      expect(result, [3, 4, 1, 2]);
    },
  );
}
