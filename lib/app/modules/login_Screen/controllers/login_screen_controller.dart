import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController instance = Get.find();
  RxBool ispasswordvisibile = true.obs;

  Future<void> loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        Get.snackbar("Login", "Your login is successfull");
      } else {
        Get.snackbar("Error Login Account", "Please enter all fields");
      }
    } catch (e) {
      Get.snackbar("Error Login account", e.toString());
    }
  }
}
