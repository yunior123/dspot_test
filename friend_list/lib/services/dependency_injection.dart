import 'package:get/get.dart';

import 'friends_api.dart';

class DependencyInjection {
  static void injectDependencies() {
    Get.lazyPut(FriendsApi.new);
  }
}
