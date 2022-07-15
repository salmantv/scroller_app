import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/imageSelect/views/image_select_view.dart';
import 'package:scroller/app/modules/login_Screen/views/login_screen_view.dart';
import 'package:scroller/app/modules/login_Screen/widgets/button_box.dart';
import 'package:scroller/app/modules/login_Screen/widgets/text_input.dart';
import 'package:scroller/app/modules/register_screen/controllers/register_screen_controller.dart';

import '../../global/views/global_view.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  final _emailcontroller = TextEditingController();
  final _paswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    "Create your \nAccount",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: MediaQuery.of(context).size.height * 0.069,
                  child: Textinputfild(
                      controller: _emailcontroller,
                      labelText: "Email",
                      icon: Icons.email),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: MediaQuery.of(context).size.height * 0.069,
                  child: Textinputfild(
                      isObscure: true,
                      iconEnd: Icons.remove_red_eye,
                      controller: _paswordcontroller,
                      labelText: "password",
                      icon: Icons.key),
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonLogin(
                  hintText: "Sign Up",
                  circular: 30,
                  Ontap: () {
                    if (_emailcontroller.text == "" ||
                        _paswordcontroller.text == "") {
                      Get.snackbar(
                          "Error Create account", "Please fill all filed");
                    } else if (!_emailcontroller.text.contains("@") ||
                        !_emailcontroller.text.contains(".") ||
                        !_emailcontroller.text.contains("com")) {
                      Get.snackbar("Error Create account",
                          "Enter a valid email address");
                    } else if (_paswordcontroller.text.length != 6) {
                      Get.snackbar("Error Create account",
                          "password length minimum 6 characters");
                    } else {
                      Get.to(ImageSelectView());
                    }
                  },
                  isImage: false,
                  colorbutton: buttonColor,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonLogin(
                  hintText: "google",
                  circular: 5,
                  Ontap: () {},
                  isImage: true,
                  colorbutton: Colors.white,
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an accoont ?",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: buttonColor, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
