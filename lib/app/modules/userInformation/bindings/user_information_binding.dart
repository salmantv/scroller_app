import 'package:get/get.dart';

import '../controllers/user_information_controller.dart';

class UserInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInformationController>(
      () => UserInformationController(),
    );
  }
}
