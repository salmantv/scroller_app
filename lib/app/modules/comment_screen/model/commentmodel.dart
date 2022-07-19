// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String usermodelToJson(Commentmodel data) => json.encode(data.toJson());

class Commentmodel {
  Commentmodel({
    required this.username,
    required this.comment,
    required this.date,
    required this.likes,
    required this.id,
    required this.uid,
    required this.profilephto,
  });

  String username;
  String comment;
  final date;
  List likes;
  String id;
  String uid;
  String profilephto;

  static Commentmodel formSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Commentmodel(
        username: snapshot["username"],
        comment: snapshot["comment"],
        date: snapshot["date"],
        likes: snapshot["likes"],
        id: snapshot["id"],
        uid: snapshot["uid"],
        profilephto: snapshot["profilephto"]);
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "comment": comment,
        "date": date,
        "likes": likes,
        "id": id,
        "uid": uid,
        "profilephto": profilephto,
      };
}
