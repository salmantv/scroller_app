import 'package:get/get.dart';

import '../controllers/profilescreen_controller.dart';

class ProfilescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilescreenController>(
      () => ProfilescreenController(),
    );
  }
}
