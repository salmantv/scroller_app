import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/comment_screen/model/commentmodel.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class CommentScreenController extends GetxController {
  final Rx<List<Commentmodel>> _commentdata = Rx<List<Commentmodel>>([]);
  List<Commentmodel> get commentdata => _commentdata.value;

  String _postId = "";
  updatePostId(String id) async {
    _postId = id;
    await getcomment();
  }

  getcomment() async {
    _commentdata.bindStream(firbasestore
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .snapshots()
        .map((QuerySnapshot Qury) {
      List<Commentmodel> reValu = [];
      for (var element in Qury.docs) {
        reValu.add(Commentmodel.formSnap(element));
      }
      return reValu;
    }));
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        String uid = firebaseAuth.currentUser!.uid;
        DocumentSnapshot usersnp =
            await firbasestore.collection("users").doc(uid).get();
        var alldocs = await firbasestore
            .collection("vidoes")
            .doc(_postId)
            .collection("comments")
            .get();
        int length = alldocs.docs.length;
        Commentmodel commentmodel = Commentmodel(
            username: (usersnp.data()! as dynamic)["name"],
            comment: commentText.trim(),
            date: DateTime.now(),
            likes: [],
            id: "comment $length",
            uid: uid,
            profilephto: (usersnp.data()! as dynamic)["prfile"]);
        await firbasestore
            .collection("videos")
            .doc(_postId)
            .collection("comments")
            .doc()
            .set(commentmodel.toJson());
        DocumentSnapshot doc =
            await firbasestore.collection("videos").doc(_postId).get();
        await firbasestore.collection("videos").doc(_postId).update({
          "commentcount": (doc.data()! as dynamic)["commentcount"] + 1,
        });
      }
    } catch (e) {
      Get.snackbar("comment error", e.toString());
    }
  }

  commentLike(String id) async {
    var uid = firebaseAuth.currentUser!.uid;

    if (firebaseAuth.currentUser!.uid == null) {
      return;
    }
    DocumentSnapshot doc = await firbasestore
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .doc(id)
        .get();

    if ((doc.data() as dynamic)["likes"].contains(uid)) {
      await firbasestore
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        "likes": FieldValue.arrayRemove([uid]),
      });
    } else {
      try {
        await firbasestore
            .collection("videos")
            .doc(_postId)
            .collection("comments")
            .doc(id)
            .update({
          "likes": FieldValue.arrayUnion([uid]),
        });
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
