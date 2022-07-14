import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/login_Screen/controllers/login_screen_controller.dart';
import 'package:scroller/app/modules/register_screen/controllers/register_screen_controller.dart';
import 'app/modules/global/views/global_view.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(LoginScreenController());
    Get.put(RegisterScreenController());
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
