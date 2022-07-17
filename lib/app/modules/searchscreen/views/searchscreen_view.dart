import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searchscreen_controller.dart';

class SearchscreenView extends GetView<SearchscreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchscreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
