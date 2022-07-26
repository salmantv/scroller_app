import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/imageSelect/controllers/image_select_controller.dart';
import 'package:scroller/app/modules/login_Screen/widgets/button_box.dart';

import '../../global/views/global_view.dart';
import '../../login_Screen/widgets/text_input.dart';
import '../controllers/user_information_controller.dart';

class UserInformationView extends GetView<UserInformationController> {
  final imagecontroller = Get.put(ImageSelectController());

  final _bio = TextEditingController();
  final _nikeName = TextEditingController();
  final _phoneNumber = TextEditingController();

  UserInformationView(
      {required this.emailTextcontroller,
      required this.paswordTextcontroller,
      required this.nametextcontroller});

  TextEditingController emailTextcontroller = TextEditingController();
  TextEditingController paswordTextcontroller = TextEditingController();
  TextEditingController nametextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            'Select Your Profile Photo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Choose your best Profile photo & it will helpe \nto setup your prfile",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Textinputfild(
                      controller: _nikeName,
                      labelText: "Nick Name",
                      icon: Icons.account_box,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Textinputfild(
                      type: TextInputType.number,
                      controller: _phoneNumber,
                      labelText: "Phone Number",
                      icon: Icons.phone,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _bio,
                      decoration: InputDecoration(
                          hintText: "bio",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          filled: true,
                          fillColor: Color(0xff1f222a),
                          labelStyle: TextStyle(fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xff091227),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(0xff091227),
                              ))),
                      minLines: 6,
                      maxLines: 6,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                ButtonLogin(
                    hintText: "Next",
                    circular: 30,
                    Ontap: () async {
                      await authController.regsterUser(
                          emailTextcontroller.text,
                          paswordTextcontroller.text,
                          nametextcontroller.text,
                          _nikeName.text,
                          _phoneNumber.text,
                          _bio.text,
                          imagecontroller.profleimage);
                      Get.snackbar(
                          "Creating acconunt", "Successfully created button");
                    },
                    isImage: false,
                    colorbutton: buttonColor),
              ],
            ),
          ),
        ));
  }
}
