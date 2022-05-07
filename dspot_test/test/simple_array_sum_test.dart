import 'package:dspot_test/simple_array_sum.dart';
import 'package:test/test.dart';

void main() {
  test('simple array sum ...', () async {
    final result = simpleArraySum([1, 2, 3, 4, 5]);
    expect(result, 15);
  });
}
