import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroller/app/modules/confermationscreen/views/confermationscreen_view.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/postUplodingscreen/model/postModel.dart';

class HomescreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _videoList.bindStream(firbasestore
        .collection("videos")
        .snapshots()
        .map((QuerySnapshot queryy) {
      List<Postmodel> allvideos = [];
      for (var elment in queryy.docs) {
        allvideos.add(Postmodel.formSnap(elment));
      }
      return allvideos;
    }));
  }

  final Rx<List<Postmodel>> _videoList = Rx<List<Postmodel>>([]);
  List<Postmodel> get vidoe => _videoList.value;

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
