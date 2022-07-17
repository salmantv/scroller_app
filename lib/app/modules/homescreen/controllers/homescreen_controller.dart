import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroller/app/modules/confermationscreen/views/confermationscreen_view.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class HomescreenController extends GetxController {
  pickvideo(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(ConfermationscreenView(
        videofile: File(video.path),
        videopath: video.path,
      ));
    } else {
      Get.snackbar("Not uplode", "Video not uplode ");
    }
  }
}
