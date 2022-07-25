import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/homescreen/views/homescreen_view.dart';

import '../controllers/massgescreen_controller.dart';

class MassgescreenView extends GetView<MassgescreenController> {
  @override
  Widget build(BuildContext context) {
    HomescreenView().openBottomSheet();
    return Scaffold(
        body: Column(
      children: [],
    ));
  }
}
