import 'package:flutter/foundation.dart';
import 'package:friend_list/services/friends_api.dart';
import 'package:get/get.dart';

import '../models/friend_model.dart';

class FriendListViewModel {
  final frindsApiService = Get.find<FriendsApi>();
  Future<List<FriendModel>> getFriendList() async {
    try {
      final result = await frindsApiService.getFriendList();
      if (result.isRight) {
        return result.right;
      }
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
    }
    return <FriendModel>[];
  }
}
