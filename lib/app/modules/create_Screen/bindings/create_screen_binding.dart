import 'package:get/get.dart';

import '../controllers/create_screen_controller.dart';

class CreateScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateScreenController>(
      () => CreateScreenController(),
    );
  }
}
