import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/home/views/home_view.dart';
import 'package:scroller/app/modules/postUplodingscreen/model/postModel.dart';
import 'package:path/path.dart';

import 'package:video_compress/video_compress.dart';

class PostUplodingscreenController extends GetxController {
  File? car;
  uploadingPost(String bio, String videpath, File videofile) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot usersnp =
          await firbasestore.collection("users").doc(uid).get();

      var videodoc = await firbasestore.collection("videos").get();
      int length = videodoc.docs.length;
      String videourl =
          await _uploadStorge("videos $length", videpath, videofile);
      String coverimage = await _uploadimage("videos $length", videpath);
      String basene = basenameWithoutExtension(videpath);
      String videoname = basene.split('r').last;
      Postmodel postmodel = Postmodel(
          username: (usersnp.data()! as Map<String, dynamic>)["name"],
          id: "videos $length",
          uid: uid,
          likes: [],
          commentcount: 0,
          sharecount: 0,
          caption: bio,
          songname: videoname,
          videourl: videourl,
          profilephto: (usersnp.data()! as Map<String, dynamic>)["prfile"],
          cover: coverimage);
      await firbasestore
          .collection("videos")
          .doc("videos $length")
          .set(postmodel.toJson());

      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar("uplodePost", e.toString());
    }
  }

  Future<String> _uploadStorge(
      String id, String videopath, File videofile) async {
    Reference ref = firebaseStorge.ref().child("videos").child(id);
    showProgerss();
    UploadTask uploadTask = ref.putFile(videofile);
    uploadTask.snapshotEvents.listen((event) {}).onError((error) {
      Get.snackbar("Uploade", error.toString());
    });
    TaskSnapshot snp = await uploadTask;
    String imageUrl = await snp.ref.getDownloadURL();
    return imageUrl;
  }

  _uploadimage(String id, String videoPath) async {
    Reference ref = firebaseStorge.ref().child("coverpic").child(id);
    File comppers = await getcoverimage(videoPath);
    UploadTask uploadTask = ref.putFile(comppers);
    TaskSnapshot snp = await uploadTask;
    String imageUrl = await snp.ref.getDownloadURL();
    return imageUrl;
  }

  Future<File> getcoverimage(String videopath) async {
    File coverimage = await VideoCompress.getFileThumbnail(videopath);
    update();
    return coverimage;
  }

  void showProgerss() {
    Get.defaultDialog(
        title: "",
        middleText: "",
        content: Center(
          child: LoadingAnimationWidget.prograssiveDots(
            size: 70,
            color: buttonColor!,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 33, 36, 42),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 14);
  }
}
