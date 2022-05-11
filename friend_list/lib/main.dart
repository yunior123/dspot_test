import 'package:flutter/material.dart';
import 'package:friend_list/services/dependency_injection.dart';
import 'package:friend_list/views/friend_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DependencyInjection.injectDependencies();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FriendListPage(),
    );
  }
}
