import 'package:flutter/material.dart';
import 'package:friend_list/views/friend_details_view.dart';
import 'package:friend_list/views/friend_list_view.dart';

class RouteService {
  static const routeMap = {
    FriendListView.route: FriendListView(),
    FriendDetailsView.route: FriendDetailsView(),
  };
  static Route<dynamic>? ongenerateRoute(RouteSettings settings) {
    final route = settings.name;
    final child = routeMap[route];
    if (child != null) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        },
      );
    } else {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const Center(
            child: Text("Something wrong!"),
          );
        },
      );
    }
  }
}
