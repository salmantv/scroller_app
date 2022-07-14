import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  Usermodel({
    required this.email,
    required this.uid,
  });

  String email;
  String uid;

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
      };

  static Usermodel formSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Usermodel(email: snapshot["email"], uid: snapshot["uid"]);
  }
}
