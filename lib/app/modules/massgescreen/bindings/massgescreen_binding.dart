import 'package:get/get.dart';

import '../controllers/massgescreen_controller.dart';

class MassgescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MassgescreenController>(
      () => MassgescreenController(),
    );
  }
}
