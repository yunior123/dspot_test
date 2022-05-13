import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/friend_details_model.dart';
import '../models/friend_model.dart';

class FriendsApi {
  late http.Client _client;
  FriendsApi({final http.Client? client}) {
    _client = client ?? http.Client();
  }
  Future<Either<String, FrindDetailsModel>> getFriendById(final int id) async {
    try {
      const url = "http://private-5bdb3-friendmock.apiary-mock.com/friends/id";

      final uri = Uri.parse(url);

      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final model = FrindDetailsModel.fromMap(data as Map<String, dynamic>);

        return Right(model);
      }
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
    }
    return const Left("Something went wrong fetching friend details data");
  }

  Future<Either<String, List<FriendModel>>> getFriendList() async {
    try {
      const url = "http://private-5bdb3-friendmock.apiary-mock.com/friends";
      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final result = data.map(
          (final e) {
            final model = FriendModel.fromMap(e as Map<String, dynamic>);
            return model;
          },
        ).toList();
        return Right(result);
      }
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
    }
    return const Left("Something went wrong fetching friends data");
  }
}
