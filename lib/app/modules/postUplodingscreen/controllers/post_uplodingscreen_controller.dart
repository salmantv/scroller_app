import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/home/views/home_view.dart';
import 'package:scroller/app/modules/postUplodingscreen/model/postModel.dart';
import 'package:video_compress/video_compress.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:path/path.dart';

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
    UploadTask uploadTask = ref.putFile(videofile);
    TaskSnapshot snp = await uploadTask;
    String imageUrl = await snp.ref.getDownloadURL();
    return imageUrl;
  }

  _compressthevideo(String videopath) async {
    final videocommperss = await VideoCompress.compressVideo(
      videopath,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
    );
    if (videocommperss == null) return videocommperss!.file;
  }

  _uploadimage(String id, String videoPath) async {
    Reference ref = firebaseStorge.ref().child("coverpic").child(id);
    UploadTask uploadTask = ref.putFile(await getcoverimage(videoPath));
    TaskSnapshot snp = await uploadTask;
    String imageUrl = await snp.ref.getDownloadURL();
    return imageUrl;
  }

  getcoverimage(String videopath) async {
    final coverimage = await VideoCompress.getFileThumbnail(videopath);
    return coverimage;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
