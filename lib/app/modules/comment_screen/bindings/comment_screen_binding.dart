import 'package:get/get.dart';

import '../controllers/comment_screen_controller.dart';

class CommentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentScreenController>(
      () => CommentScreenController(),
    );
  }
}
