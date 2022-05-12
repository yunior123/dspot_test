import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friend_list/services/friends_api.dart';
import 'package:friend_list/views/args/friend_details_args.dart';
import 'package:friend_list/views/friend_details_view.dart';
import 'package:get/get.dart';

import '../models/friend_model.dart';

class FriendListViewModel {
  final friendsApiService = Get.find<FriendsApi>();
  Future<List<FriendModel>> getFriendList() async {
    try {
      final result = await friendsApiService.getFriendList();
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

  Future<void> onDetailsButtonPressed(BuildContext context, int id) async {
    await Navigator.of(context).pushNamed(
      FriendDetailsView.route,
      arguments: FriendDetailsArgs(id),
    );
  }
}
