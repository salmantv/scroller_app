import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroller/app/modules/comment_screen/views/comment_screen_view.dart';
import 'package:scroller/app/modules/homescreen/widget/bottumsheet.dart';
import 'package:scroller/app/modules/homescreen/widget/circularanimation.dart';
import 'package:scroller/app/modules/homescreen/widget/video_player_controller.dart';
import 'package:video_player/video_player.dart';

import '../../../icons/icons.dart';
import '../../global/views/global_view.dart';
import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  final homecontroller = Get.put(HomescreenController());

  buildMusicalbam(String profile) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey,
                Colors.white,
              ]),
              borderRadius: BorderRadiusDirectional.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(image: NetworkImage(profile)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homecontroller.vidoe.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemBuilder: (context, index) {
              final data = homecontroller.vidoe[index];
              return Stack(
                children: [
                  VideoplayItem(videoUrl: data.videourl),
                  Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.black,
                                            child: Image(
                                              image: NetworkImage(
                                                  data.profilephto),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            AutoSizeText(
                                              data.username,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text(
                                                "Nike name",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text(
                                        data.caption,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.music_note_rounded,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AutoSizeText(
                                              maxLines: 2,
                                              data.songname,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 60,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(top: size.height / 4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            homecontroller.likevideo(data.id),
                                        icon: Icon(Icons.favorite,
                                            size: 40,
                                            color: data.likes.contains(
                                                    firebaseAuth
                                                        .currentUser!.uid)
                                                ? Color.fromARGB(
                                                    255, 202, 88, 80)
                                                : Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14, top: 10),
                                        child: Text(
                                          data.likes.length.toString(),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          commentbottomsheet(context, data.id);
                                        },
                                        icon: Icon(
                                          Icons.mode_comment_sharp,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Text(
                                          data.commentcount.toString(),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.share,
                                          size: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Text(
                                          data.sharecount.toString(),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Circularanimation(
                                          child:
                                              buildMusicalbam(data.profilephto))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
      }),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
          height: 180,
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  await homecontroller.pickvideo(ImageSource.gallery);
                },
                child: Container(
                  color: borderColor,
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Post",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      IconButton(
                          onPressed: () async {
                            await homecontroller.pickvideo(ImageSource.gallery);
                          },
                          icon: Icon(Icons.slow_motion_video_outlined))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: borderColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Camera",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.camera))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: borderColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.cancel))
                    ],
                  ),
                ),
              ),
            ],
          )),
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
