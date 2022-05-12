import 'package:friend_list/models/friend_details_model.dart';
import 'package:get/get.dart';

import '../services/friends_api.dart';

class FriendDetailsViewModel {
  final friendsApiService = Get.find<FriendsApi>();
  Future<FrindDetailsModel?> getFriendDetails(int id) async {
    final result = await friendsApiService.getFriendById(id);
    if (result.isRight) {
      return result.right;
    }
    return null;
  }
}
