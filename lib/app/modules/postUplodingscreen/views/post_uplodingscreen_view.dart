import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scroller/app/modules/confermationscreen/views/widget/button.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/home/views/home_view.dart';
import 'package:video_compress/video_compress.dart';
import '../../confermationscreen/controllers/confermationscreen_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/post_uplodingscreen_controller.dart';

class PostUplodingscreenView extends GetView<PostUplodingscreenController> {
  final File videofile;
  final String videopath;

  PostUplodingscreenView(
      {required this.videofile,
      required this.videopath,
      required this.Coverimage});

  final confermationcontroller = Get.put(ConfermationscreenController());
  final postuplodecontroller = Get.put(PostUplodingscreenController());
  final homecontroller = Get.put(HomeController());

  final bioTextcontroll = TextEditingController();
  File Coverimage;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        confermationcontroller.controller.play();
        Get.back();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Text("Post"),
            elevation: 00,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 170,
                        child: TextField(
                          controller: bioTextcontroll,
                          decoration: InputDecoration(
                              hintText: "",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              filled: true,
                              fillColor: Color(0xff1f222a),
                              labelStyle: TextStyle(fontSize: 20),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xff091227),
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xff091227),
                                  ))),
                          minLines: 6,
                          maxLines: 6,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff1f222a),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.file(
                          File(
                            Coverimage.path,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      color: Color.fromARGB(76, 158, 158, 158),
                      thickness: 0.9,
                      height: 50,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Visible to Everyone",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      size: 35,
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          postuplodecontroller.showProgerss();
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    title: Text(
                      "Location",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    leading: Icon(
                      Icons.location_on_outlined,
                      size: 35,
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          (videopath);
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 550,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NextButton(
                        hintText: "Cancel",
                        circular: 30,
                        Ontap: () {
                          cancelPop();
                        },
                        colorbutton: Color(0xff1f222a),
                      ),
                      NextButton(
                          hintText: "Post",
                          circular: 30,
                          Ontap: () async {
                            await postuplodecontroller.uploadingPost(
                                bioTextcontroll.text, videopath, videofile);
                            Get.back();
                          },
                          colorbutton: buttonColor),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void cancelPop() {
    Get.defaultDialog(
        title: "",
        middleText: "",
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 80,
              child: Text("Are you sure you want cancel ?"),
            ),
            TextButton(
                onPressed: () async {
                  confermationcontroller.dispose();
                  homecontroller.pageindex.value = 0;
                  await Get.offAll(HomeView());
                },
                child: Text("Conform")),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel")),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 33, 36, 42),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 14);
  }
}
