import 'package:friend_list/services/friends_api.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void injectDependencies() {
    Get.lazyPut(() => FriendsApi());
  }
}
