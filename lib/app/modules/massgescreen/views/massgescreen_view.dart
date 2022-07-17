import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/massgescreen_controller.dart';

class MassgescreenView extends GetView<MassgescreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MassgescreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MassgescreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
