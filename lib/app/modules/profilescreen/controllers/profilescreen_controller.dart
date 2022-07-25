import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class ProfilescreenController extends GetxController {
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
    log(bio.toString());
  }
}
