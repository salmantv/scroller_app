// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String usermodelToJson(Postmodel data) => json.encode(data.toJson());

class Postmodel {
  Postmodel({
    required this.username,
    required this.id,
    required this.uid,
    required this.likes,
    required this.commentcount,
    required this.sharecount,
    required this.caption,
    required this.songname,
    required this.videourl,
    required this.profilephto,
    required this.cover,
  });

  String username;
  String id;
  String uid;
  List likes;
  int commentcount;
  int sharecount;
  String caption;
  String songname;
  String videourl;
  String profilephto;
  String cover;

  static Postmodel formSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Postmodel(
        caption: snapshot['caption'],
        commentcount: snapshot['commentcount'],
        cover: snapshot['cover'],
        id: snapshot['id'],
        likes: snapshot['likes'],
        profilephto: snapshot['profilephto'],
        sharecount: snapshot['sharecount'],
        songname: snapshot['songname'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        videourl: snapshot['videourl']);
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "uid": uid,
        "likes": likes,
        "commentcount": commentcount,
        "sharecount": sharecount,
        "caption": caption,
        "songname": songname,
        "videourl": videourl,
        "profilephto": profilephto,
        "cover": cover,
      };
}
