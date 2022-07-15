import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scroller/app/modules/register_screen/model/userModel.dart';

class RegisterScreenController extends GetxController {
  static RegisterScreenController instance = Get.find();

  late Rx<User?> _user;

  // @override
  // void onReady() {
  //   super.onReady();
  //   _user = Rx<User?>(firebaseAuth.currentUser);
  //   _user.bindStream(firebaseAuth.authStateChanges());
  //   ever(_user, _stInit);
  // }

  // _stInit(User? user) {
  //   if (user == null) {
  //     Get.offAll(());
  //   } else {
  //     Get.offAll(HomeView());
  //   }
  // }

  Future regsterUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        //String downloadUrl = await _uploadeToStroge();
        Usermodel usermodel =
            Usermodel(email: email, uid: userCredential.user!.uid);
        await firbasestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(usermodel.toJson())
            .catchError((e) {
          Get.snackbar("Error Create account", "${e.message}");
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
