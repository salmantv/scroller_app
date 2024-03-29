import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/login_Screen/controllers/login_screen_controller.dart';
import 'package:scroller/app/modules/profilescreen/controllers/profilescreen_controller.dart';
import 'package:scroller/app/modules/register_screen/controllers/register_screen_controller.dart';
import 'app/modules/global/views/global_view.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(LoginScreenController());
    Get.put(RegisterScreenController());
    Get.put(ProfilescreenController());
  });

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundcolor),
      title: "Scroller",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
