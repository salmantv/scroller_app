import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroller/app/modules/homescreen/widget/bottumsheet.dart';

import '../../../icons/icons.dart';
import '../../global/views/global_view.dart';
import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  final homecontroller = Get.put(HomescreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Customicon.search,
          size: 18,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                openBottomSheet();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(),
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
