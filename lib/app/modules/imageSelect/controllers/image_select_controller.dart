import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectController extends GetxController {
  late Rx<File?> _pickedpicture;

  File? get profleimage => _pickedpicture.value;

  void pickImage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      Get.snackbar("Profile Picture", "You have successfully add image!");
    } else {
      Get.snackbar("Profile Picture", "Profile picture not selected!");
    }

    _pickedpicture = Rx<File?>(File(pickedimage!.path));
  }
}
