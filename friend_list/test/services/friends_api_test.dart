import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/services/friends_api.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fake_friends_data.dart';
import 'friends_api_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
// flutter pub run build_runner build

@GenerateMocks([http.Client])
void main() {
  // Integration tests
  group(
    "Testing Friends API endpoints",
    () {
      final client = MockClient();
      test(
        "Testing Getting friend by id method",
        () async {
          final friendApi = FriendsApi(client: client);

          final response = await friendApi.getFriendById(1);
          // Use Mockito to return a successful response when it calls the
          // provided http.Client.
          const url =
              "http://private-5bdb3-friendmock.apiary-mock.com/friends/id";
          when(
            client.get(
              Uri.parse(url),
            ),
          ).thenAnswer(
            (final _) async =>
                http.Response(jsonEncode(fakeDataFriendsDetails), 200),
          );

          expect(response.isRight, true);
        },
      );

      test(
        "Testing Getting list of friends",
        () async {
          final friendApi = FriendsApi(client: client);

          final response = await friendApi.getFriendById(1);
          // Use Mockito to return a successful response when it calls the
          // provided http.Client.
          const url = "http://private-5bdb3-friendmock.apiary-mock.com/friends";

          when(
            client.get(
              Uri.parse(url),
            ),
          ).thenAnswer(
            (final _) async =>
                http.Response(jsonEncode(fakeDataFriendsDetails), 200),
          );

          expect(response.isRight, true);
        },
      );
    },
  );
}
