import 'package:get/get.dart';

import 'package:scroller/app/modules/home/bindings/home_binding.dart';
import 'package:scroller/app/modules/home/views/home_view.dart';
import 'package:scroller/app/modules/imageSelect/bindings/image_select_binding.dart';
import 'package:scroller/app/modules/imageSelect/views/image_select_view.dart';
import 'package:scroller/app/modules/login_Screen/bindings/login_screen_binding.dart';
import 'package:scroller/app/modules/register_screen/bindings/register_screen_binding.dart';
import 'package:scroller/app/modules/splash_Screen/bindings/splash_screen_binding.dart';
import 'package:scroller/app/modules/userInformation/bindings/user_information_binding.dart';
import 'package:scroller/app/modules/userInformation/views/user_information_view.dart';

import '../modules/login_Screen/views/login_screen_view.dart';
import '../modules/register_screen/views/register_screen_view.dart';
import '../modules/splash_Screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.USER_INFORMATION,
    //   page: () => UserInformationView(),
    //   binding: UserInformationBinding(),
    // ),
  ];
}
