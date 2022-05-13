import 'package:get/get.dart';

import '../models/friend_details_model.dart';
import '../services/friends_api.dart';

class FriendDetailsViewModel {
  final friendsApiService = Get.find<FriendsApi>();
  Future<FrindDetailsModel?> getFriendDetails(final int id) async {
    final result = await friendsApiService.getFriendById(id);
    if (result.isRight) {
      return result.right;
    }
    return null;
  }
}
