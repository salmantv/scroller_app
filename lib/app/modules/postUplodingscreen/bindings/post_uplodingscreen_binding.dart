import 'package:get/get.dart';

import '../controllers/post_uplodingscreen_controller.dart';

class PostUplodingscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostUplodingscreenController>(
      () => PostUplodingscreenController(),
    );
  }
}
