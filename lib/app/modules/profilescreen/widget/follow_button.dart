import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/profilescreen/controllers/profilescreen_controller.dart';

class Followbutton extends StatelessWidget {
  final profileStatecontroller = Get.put(ProfilescreenController());

  Followbutton(
      {Key? key,
      required this.hintText,
      required this.circular,
      required this.Ontap,
      required this.isImage,
      required this.colorbutton})
      : super(key: key);

  final String hintText;
  final double circular;
  final void Function()? Ontap;
  final bool isImage;
  final Color? colorbutton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Ontap,
      child: Container(
          width: MediaQuery.of(context).size.width - 290,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: buttonColor!),
              color: colorbutton,
              borderRadius: BorderRadius.circular(circular)),
          child: Center(
            child: Text(profileStatecontroller.user["isfollowing"]
                ? "Unfollow"
                : "Follow"),
          )),
    );
  }
}
