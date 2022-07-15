import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectController extends GetxController {
  File? _pickedpicture;

  File? get profleimage => _pickedpicture;

  void pickImage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      Get.snackbar("Profile Picture", "You have successfully add image!");
    } else {
      Get.snackbar("Profile Picture", "Profile picture not selected!");
    }
    _pickedpicture = File(pickedimage!.path);
    log(_pickedpicture.toString());
  }
}
