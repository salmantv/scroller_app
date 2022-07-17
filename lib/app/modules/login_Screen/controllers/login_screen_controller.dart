import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController instance = Get.find();
  RxBool ispasswordvisibile = false.obs;

  Future<void> loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        Get.snackbar("Login", "Yout login is successful");
      } else {
        Get.snackbar("Error Login Account", "Please enter all fields");
      }
    } catch (e) {
      Get.snackbar("Error Login account", e.toString());
    }
  }
}
