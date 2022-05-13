import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.

void main() {
  // Integration tests
  group(
    "Testing Friends API endpoints",
    () {
      test(
        "Testing Getting friend by id method",
        () async {
          const url =
              "http://private-5bdb3-friendmock.apiary-mock.com/friends/id";

          // final queryParameters = <String, dynamic>{
          //   "id": "1",
          // };
          final uri = Uri.parse(url);
          // uri = uri.replace(
          //   queryParameters: queryParameters,
          // );

          final response = await http.get(uri);

          expect(response.statusCode, 200);
        },
      );

      test(
        "Testing Getting list of friends",
        () async {
          const url = "http://private-5bdb3-friendmock.apiary-mock.com/friends";

          final uri = Uri.parse(url);

          final response = await http.get(uri);

          expect(response.statusCode, 200);
        },
      );
    },
  );
}
