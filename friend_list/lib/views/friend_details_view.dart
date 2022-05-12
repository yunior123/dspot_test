import 'package:flutter/material.dart';
import 'package:friend_list/view_models/friend_details_view_models.dart';
import 'package:friend_list/widgets/image_component.dart';
import 'package:get/get.dart';

import '../models/friend_details_model.dart';
import 'args/friend_details_args.dart';

class FriendDetailsView extends StatelessWidget {
  static const route = "friend_details/";
  const FriendDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final viewModel = Get.put(FriendDetailsViewModel());
    if (args == null) {
      return const Scaffold(
        body: Center(
          child: Text("No data provided"),
        ),
      );
    }
    final friendDetailsArgs = args as FriendDetailsArgs;
    final id = friendDetailsArgs.id;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButton(),
          Flexible(
            child: FutureBuilder<FrindDetailsModel?>(
              future: viewModel.getFriendDetails(id),
              builder: (BuildContext context,
                  AsyncSnapshot<FrindDetailsModel?> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                final model = snapshot.data!;
                final fullName = model.firstName + " " + model.lastName;
                final status =
                    model.statuses.isNotEmpty ? model.statuses.first : "";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: model.id,
                        child: ImageComponent(
                          imageUrl: model.img,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(fullName),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(status),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: TabbarView(
                          model: model,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  final FrindDetailsModel model;
  const Info({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Bio:"),
        const SizedBox(
          height: 10,
        ),
        Text(model.bio),
        const SizedBox(
          height: 10,
        ),
        RowItem(
          text: model.address_1,
          title: "Address:",
        ),
        const SizedBox(
          height: 10,
        ),
        RowItem(
          text: model.city,
          title: "City:",
        ),
        const SizedBox(
          height: 10,
        ),
        RowItem(
          text: model.state,
          title: "State:",
        ),
        const SizedBox(
          height: 10,
        ),
        RowItem(
          text: model.zipcode,
          title: "Zipcode:",
        ),
        const SizedBox(
          height: 10,
        ),
        RowItem(
          text: model.phone,
          title: "Phone:",
        ),
      ],
    );
  }
}

class Photos extends StatelessWidget {
  final List<String> photos;
  const Photos({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO use image widget component
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.amber,
            child: Center(child: Text('$index')),
          );
        },
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String text;
  final String title;
  const RowItem({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
          width: screenWidth / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
            ],
          ),
        ),
      ],
    );
  }
}

class TabbarView extends StatelessWidget {
  final FrindDetailsModel model;
  const TabbarView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(
        children: [
          Info(
            model: model,
          ),
          Photos(
            photos: model.photos,
          ),
        ],
      ),
    );
  }
}
