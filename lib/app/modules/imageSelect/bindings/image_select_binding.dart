import 'package:get/get.dart';

import '../controllers/image_select_controller.dart';

class ImageSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageSelectController>(
      () => ImageSelectController(),
    );
  }
}
