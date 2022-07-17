import 'package:get/get.dart';

import '../controllers/searchscreen_controller.dart';

class SearchscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchscreenController>(
      () => SearchscreenController(),
    );
  }
}
