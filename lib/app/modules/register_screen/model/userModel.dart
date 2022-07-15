import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  Usermodel({
    required this.name,
    required this.email,
    required this.uid,
    required this.nikename,
    required this.number,
    required this.bio,
    required this.profile,
  });

  String name;
  String email;
  String uid;
  String nikename;
  String number;
  String bio;
  String profile;

  static Usermodel formSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Usermodel(
      email: snapshot["email"],
      uid: snapshot["uid"],
      bio: snapshot["bio"],
      name: snapshot["name"],
      nikename: snapshot["nikename"],
      number: snapshot["number"],
      profile: snapshot["prfile"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "nikename": nikename,
        "number": number,
        "bio": bio,
        "prfile": profile,
      };
}
