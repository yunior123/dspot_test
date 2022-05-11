import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/friend_model.dart';
import 'fake_friends_data.dart';

class FriendsApi {
  Future<Either<String, FriendModel>> getFriendById(int id) async {
    try {
      //TODO: giving 403

      final url = "http://private-5bdb3-friendmock.apiary-mock.com/friends/$id";
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final model = FriendModel.fromMap(data);

      return Right(model);
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
    }
    return const Left("Something went wrong fetching friends data");
  }

  Future<Either<String, List<FriendModel>>> getFriendList() async {
    try {
      //TODO: giving 403

      // const url = "http://private-5bdb3-friendmock.apiary-mock.com/friends";
      // // final response = await http.get(Uri.parse(url));
      // final data = jsonDecode(response.body) as List;

      final result = fakeData.map(
        (e) {
          final model = FriendModel.fromMap(e);
          return model;
        },
      ).toList();
      return Right(result);
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
    }
    return const Left("Something went wrong fetching friends data");
  }
}
