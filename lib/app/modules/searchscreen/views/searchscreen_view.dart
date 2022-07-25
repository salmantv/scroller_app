import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/profilescreen/views/profilescreen_view.dart';
import 'package:scroller/app/modules/searchscreen/views/widget/search.dart';
import '../controllers/searchscreen_controller.dart';

class SearchscreenView extends GetView<SearchscreenController> {
  final textController = TextEditingController();
  final searchStateController = Get.put(SearchscreenController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Searchfild(
              controller: textController,
              labelText: "Search",
              icon: Icons.search,
              onSubmite: (value) {
                searchStateController.searchUser(value);
              },
            ),
          ),
        ),
        body: searchStateController.searchuser.isEmpty
            ? Center(
                child: Text("Serch Users"),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: ListView.builder(
                    itemCount: searchStateController.searchuser.length,
                    itemBuilder: ((context, index) {
                      final data = searchStateController.searchuser[index];
                      return InkWell(
                        onTap: () async {
                          await Get.to(ProfilescreenView(
                              uid: data.uid, isCurrentuser: false));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: ClipOval(
                                child: CachedNetworkImage(
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                  imageUrl: data.profile,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: buttonColor,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              title: Text(
                                data.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              subtitle: Text(
                                data.nikename,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              trailing: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
      );
    });
  }
}
