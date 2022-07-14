import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/global/views/global_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
