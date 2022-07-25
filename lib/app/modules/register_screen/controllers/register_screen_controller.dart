import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scroller/app/modules/home/views/home_view.dart';
import 'package:scroller/app/modules/login_Screen/views/login_screen_view.dart';
import 'package:scroller/app/modules/profilescreen/controllers/profilescreen_controller.dart';
import 'package:scroller/app/modules/register_screen/model/userModel.dart';

class RegisterScreenController extends GetxController {
  static RegisterScreenController instance = Get.find();
  final controller = Get.put(ProfilescreenController());

  late Rx<User?> _user;

  @override
  void onReady() async {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _stInit);
  }

  _stInit(User? user) {
    if (user == null) {
      Get.offAll(LoginScreenView());
    } else {
      Get.offAll(HomeView());
    }
  }

  Future regsterUser(String email, String password, String name,
      String nikename, String number, String bio, File? image) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          nikename.isNotEmpty &&
          number.isNotEmpty &&
          bio.isNotEmpty &&
          image != null) {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadeToStroge(image);
        Usermodel usermodel = Usermodel(
            email: email,
            uid: userCredential.user!.uid,
            bio: bio,
            name: name,
            nikename: nikename,
            number: number,
            profile: downloadUrl);
        await firbasestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(usermodel.toJson())
            .catchError((e) {
          Get.snackbar("Error Create accoun", "${e.message}");
          Get.offAll(HomeView());
        });
      } else {
        Get.snackbar("Error Create account", "Please enter all fields");
      }
    } catch (e) {
      Get.snackbar("Error Create account", e.toString());
    }
  }

  Future<String> _uploadeToStroge(File image) async {
    Reference ref = await firebaseStorge
        .ref()
        .child("ProfileImage/${firebaseAuth.currentUser!.uid}");
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snp = await uploadTask;
    String downloadUrl = await snp.ref.getDownloadURL();
    return downloadUrl;
  }
}
