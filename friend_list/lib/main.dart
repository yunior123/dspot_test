import 'package:flutter/material.dart';

import 'services/dependency_injection.dart';
import 'services/route_services.dart';
import 'views/friend_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    DependencyInjection.injectDependencies();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friends List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteService.ongenerateRoute,
      home: const FriendListView(),
    );
  }
}
