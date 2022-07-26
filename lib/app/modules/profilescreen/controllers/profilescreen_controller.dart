import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class ProfilescreenController extends GetxController {
  Rx<bool> isdatathere = RxBool(false);
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get user => _user.value;

  final Rx<String> _uid = ''.obs;

  updateUderid(String id) {
    _uid.value = id;
    getUserData();
  }

  getUserData() async {
    List<String> thumbile = [];

    var myvideos = await firbasestore
        .collection("videos")
        .where("uid", isEqualTo: _uid.value)
        .get();
    isdatathere = Rx(false);
    for (int i = 0; i < myvideos.docs.length; i++) {
      thumbile.add((myvideos.docs[i].data() as dynamic)["cover"]);
    }
    update();

    DocumentSnapshot userData =
        await firbasestore.collection("users").doc(_uid.value).get();

    final userdata = userData.data()! as dynamic;
    String name = userData["name"];
    String profile = userData["prfile"];
    int likes = 0;
    int followers = 0;
    int following = 0;
    bool isfollowing = false;
    String bio = userData["bio"];

    for (var element in myvideos.docs) {
      likes += (element.data()['likes'] as List).length;
    }

    var followorsDoc = await firbasestore
        .collection("users")
        .doc(_uid.value)
        .collection("followers")
        .get();

    var followingdoc = await firbasestore
        .collection("users")
        .doc(_uid.value)
        .collection("following")
        .get();

    followers = followorsDoc.docs.length;
    following = followingdoc.docs.length;

    await firbasestore
        .collection("users")
        .doc(_uid.value)
        .collection('followers')
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        isfollowing = true;
      } else {
        isfollowing = false;
      }
    });
    isdatathere = Rx(true);

    log(name);

    _user.value = {
      "followers": followers.toString(),
      "following": following.toString(),
      "isfollowing": isfollowing,
      "likes": likes.toString(),
      "profilePhoto": profile,
      "name": name,
      "cover": thumbile,
      "bio": bio,
    };
    update();
  }

  void showProgerss() {
    Get.defaultDialog(
        content: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: CircularProgressIndicator(color: Colors.red),
          ),
        ),
        title: "",
        titleStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
        middleText: "",
        actions: [],
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 8);
  }

  followerUser() async {
    var doc = await firbasestore
        .collection("users")
        .doc(_uid.value)
        .collection("followers")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    if (!doc.exists) {
      await firbasestore
          .collection("users")
          .doc(_uid.value)
          .collection("followers")
          .doc(firebaseAuth.currentUser!.uid)
          .set({});
      await firbasestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .collection("following")
          .doc(_uid.value)
          .set({});
      _user.value.update(
        "followers",
        (value) => (int.parse(value) + 1).toString(),
      );
    } else {
      await firbasestore
          .collection("users")
          .doc(_uid.value)
          .collection("followers")
          .doc(firebaseAuth.currentUser!.uid)
          .delete();
      await firbasestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .collection("following")
          .doc(_uid.value)
          .delete();
      _user.value.update(
        "followers",
        (value) => (int.parse(value) - 1).toString(),
      );
    }
    _user.value.update("isfollowing", (value) => !value);
    update();
  }
}
