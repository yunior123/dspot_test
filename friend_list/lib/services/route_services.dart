import 'package:flutter/material.dart';

import '../views/friend_details_view.dart';
import '../views/friend_list_view.dart';

class RouteService {
  static const routeMap = {
    FriendListView.route: FriendListView(),
    FriendDetailsView.route: FriendDetailsView(),
  };
  static Route<dynamic>? ongenerateRoute(final RouteSettings settings) {
    final route = settings.name;
    final child = routeMap[route];
    if (child != null) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder:
            (final context, final animation, final secondaryAnimation) {
          return child;
        },
      );
    } else {
      return PageRouteBuilder(
        pageBuilder:
            (final context, final animation, final secondaryAnimation) {
          return const Center(
            child: Text("Something wrong!"),
          );
        },
      );
    }
  }
}
