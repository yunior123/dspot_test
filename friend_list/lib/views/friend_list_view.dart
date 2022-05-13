import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/friend_model.dart';
import '../view_models/friend_list_view_model.dart';
import '../widgets/image_component.dart';
import '../widgets/status_component.dart';

class FriendListView extends StatelessWidget {
  static const route = "/";
  const FriendListView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final viewModel = Get.put(FriendListViewModel());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Friends",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      color: Color.fromRGBO(
                        177,
                        185,
                        219,
                        1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: FutureBuilder<List<FriendModel>>(
                  future: viewModel.getFriendList(),
                  builder: (
                    final BuildContext context,
                    final AsyncSnapshot<List<FriendModel>> snapshot,
                  ) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    final friendList = snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: friendList.length,
                      itemBuilder:
                          (final BuildContext context, final int index) {
                        final model = friendList[index];
                        final fullName = "${model.firstName} ${model.lastName}";
                        return Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: SizedBox(
                            height: 88,
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Hero(
                                      tag: model.id,
                                      child: ImageComponent(
                                        imageUrl: model.imageUrl,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            fullName,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          StatusComponenet(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    model.status * 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          const Color.fromRGBO(
                                                        177,
                                                        185,
                                                        219,
                                                        1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    MaterialButton(
                                      key: Key(model.id.toString()),
                                      color:
                                          const Color.fromRGBO(46, 87, 250, 1),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "Details",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                              255,
                                              255,
                                              255,
                                              1,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
