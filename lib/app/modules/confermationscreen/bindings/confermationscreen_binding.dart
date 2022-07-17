import 'package:get/get.dart';

import '../controllers/confermationscreen_controller.dart';

class ConfermationscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfermationscreenController>(
      () => ConfermationscreenController(),
    );
  }
}
