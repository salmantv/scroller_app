import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_screen_controller.dart';

class CreateScreenView extends GetView<CreateScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
