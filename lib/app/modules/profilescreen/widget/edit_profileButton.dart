import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/login_Screen/views/login_screen_view.dart';

import '../controllers/profilescreen_controller.dart';

class EditingButton extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  EditingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      child: ElevatedButton.icon(
        onPressed: () async {
          await _firebaseAuth.signOut();
          await Get.offAll(LoginScreenView());
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red))),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            fixedSize: MaterialStateProperty.all(Size.infinite)),
        icon: Icon(
          Icons.edit,
          size: 18,
        ),
        label: Text("Edit Profile"),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
