import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

import '../controllers/profilescreen_controller.dart';

class ProfilescreenView extends GetView<ProfilescreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          firebaseAuth.signOut();
        },
        child: Center(
          child: Text(
            'ProfilescreenView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
