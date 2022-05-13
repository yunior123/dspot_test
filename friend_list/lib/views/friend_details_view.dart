import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/friend_details_model.dart';
import '../view_models/friend_details_view_models.dart';
import '../widgets/image_component.dart';
import '../widgets/photo_viewer.dart';
import '../widgets/status_component.dart';
import 'args/friend_details_args.dart';

class FriendDetailsView extends StatelessWidget {
  static const route = "friend_details/";
  const FriendDetailsView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                Card(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: BackButton(
                    color: Color.fromRGBO(46, 87, 250, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: FutureBuilder<FrindDetailsModel?>(
                future: viewModel.getFriendDetails(id),
                builder: (
                  final BuildContext context,
                  final AsyncSnapshot<FrindDetailsModel?> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  final model = snapshot.data!;
                  final fullName = "${model.firstName} ${model.lastName}";
                  final status =
                      model.statuses.isNotEmpty ? model.statuses.first : "";
                  return Card(
                    margin: EdgeInsets.zero,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: model.id,
                              child: ImageComponent(
                                size: const Size(150, 150),
                                imageUrl: model.img,
                              ),
                            ),
                            const SizedBox(
                              height: 54,
                            ),
                            Text(
                              fullName,
                              style: GoogleFonts.inter(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            StatusComponenet(
                              child: Text(
                                status,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(
                                    177,
                                    185,
                                    219,
                                    1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 500,
                              child: TabbarView(
                                model: model,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final FrindDetailsModel model;
  const Info({
    final Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bio:",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.bio,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
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
      ),
    );
  }
}

class Photos extends StatelessWidget {
  final List<String> photos;
  const Photos({
    final Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  // ignore: prefer_final_parameters
  Widget build(BuildContext context) {
    //TODO check image url
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: photos.length,
        itemBuilder: (final BuildContext _, final int index) {
          return Card(
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (final _) {
                    return const PhotoViewer(imageUrl: "");
                  },
                );
              },
              child: const ImageComponent(
                size: Size(136, 136),
                imageUrl: "",
              ),
            ),
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
    final Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final BuildContext context, final BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: constraints.maxWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class TabbarView extends StatelessWidget {
  final FrindDetailsModel model;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'LEFT'),
    const Tab(text: 'RIGHT'),
  ];

  TabbarView({
    final Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
            tabs: const [
              Tab(
                child: Text(
                  "Info",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Photos",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: TabBarView(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Info(
                        model: model,
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Photos(
                        photos: model.photos,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
