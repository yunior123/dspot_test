import 'package:flutter/material.dart';
import 'package:friend_list/services/dependency_injection.dart';
import 'package:friend_list/views/friend_list_view.dart';

import 'services/route_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
