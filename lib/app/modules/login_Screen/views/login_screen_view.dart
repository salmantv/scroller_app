import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/login_Screen/widgets/button_box.dart';
import 'package:scroller/app/modules/login_Screen/widgets/passwordfild.dart';
import 'package:scroller/app/modules/login_Screen/widgets/text_input.dart';
import 'package:scroller/app/modules/register_screen/views/register_screen_view.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
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
                    "Login to your \nAccount",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
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
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: MediaQuery.of(context).size.height * 0.069,
                  child: Passwordfild(
                      iconEnd: Icons.remove_red_eye,
                      controller: _paswordcontroller,
                      labelText: "password",
                      icon: Icons.key),
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonLogin(
                  hintText: "Login",
                  circular: 30,
                  Ontap: () async {
                    await logincontroll.loginUser(
                        _emailcontroller.text, _paswordcontroller.text);
                  },
                  isImage: false,
                  colorbutton: buttonColor,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot the password?",
                    style: TextStyle(color: buttonColor, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                      "Don \' t have an accoont ?",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterScreenView());
                      },
                      child: Text(
                        "Register",
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
