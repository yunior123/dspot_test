import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:friend_list/models/friend_details_model.dart';
import 'package:http/http.dart' as http;

import '../models/friend_model.dart';

class FriendsApi {
  Future<Either<String, FrindDetailsModel>> getFriendById(int id) async {
    try {
      const url = "http://private-5bdb3-friendmock.apiary-mock.com/friends/id";

      // final queryParameters = <String, dynamic>{
      //   "id": "$id",
      // };
      final uri = Uri.parse(url);
      // uri.replace(
      //   queryParameters: queryParameters,
      // );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
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
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          // print(response.body);
        }
        final data = jsonDecode(response.body) as List;
        final result = data.map(
          (e) {
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
