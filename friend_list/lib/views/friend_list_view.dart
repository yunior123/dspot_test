import 'package:flutter/material.dart';
import 'package:friend_list/view_models/friend_list_view_model.dart';
import 'package:get/get.dart';

import '../models/friend_model.dart';
import '../widgets/image_component.dart';

class FriendListView extends StatelessWidget {
  static const route = "friend_list/";
  const FriendListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(FriendListViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friend List"),
      ),
      body: FutureBuilder<List<FriendModel>>(
        future: viewModel.getFriendList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FriendModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          final friendList = snapshot.data!;

          return ListView.builder(
            itemCount: friendList.length,
            itemBuilder: (BuildContext context, int index) {
              final model = friendList[index];
              final fullName = model.firstName + " " + model.lastName;
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageComponent(
                      imageUrl: model.imageUrl,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(fullName),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(model.status),
                        ],
                      ),
                    ),
                    MaterialButton(
                      color: const Color.fromRGBO(46, 87, 250, 1),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 91,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          child: Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        viewModel.onDetailsButtonPressed(
                          context,
                          model.id,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
