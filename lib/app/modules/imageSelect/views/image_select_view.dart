import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/login_Screen/widgets/button_box.dart';
import 'package:scroller/app/modules/login_Screen/widgets/text_input.dart';

import '../controllers/image_select_controller.dart';

class ImageSelectView extends GetView<ImageSelectController> {
  final _nameTextController = TextEditingController();
  final imagecontroller = Get.put(ImageSelectController());

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
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Choose your best Profile photo & it will helpe \nto setup your prfile",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                  onTap: () => imagecontroller.pickImage(),
                  child: imagecontroller.profleimage == null
                      ? Container(
                          margin: EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                              radius: 70,
                              backgroundColor: borderColor,
                              backgroundImage:
                                  FileImage(imagecontroller.profleimage!)),
                        )
                      : Container(
                          child: CircleAvatar(
                            child: Image.network(""),
                          ),
                        )),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Textinputfild(
                      controller: _nameTextController,
                      labelText: "Full Name",
                      icon: Icons.person),
                ),
              ),
              SizedBox(
                height: 210,
              ),
              ButtonLogin(
                  hintText: "Next",
                  circular: 30,
                  Ontap: () {},
                  isImage: false,
                  colorbutton: buttonColor)
            ],
          ),
        ));
  }
}
