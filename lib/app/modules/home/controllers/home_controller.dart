import 'package:get/get.dart';
import 'package:scroller/app/modules/homescreen/controllers/homescreen_controller.dart';
import 'package:scroller/app/modules/profilescreen/controllers/profilescreen_controller.dart';

class HomeController extends GetxController {
  final cont = Get.put(ProfilescreenController());
  RxInt pageindex = 0.obs;
  void getdata() async {
    await cont.getUserData();
  }
}
