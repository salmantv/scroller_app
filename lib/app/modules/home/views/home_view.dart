import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/icons/icons.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

import '../../homescreen/controllers/homescreen_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homecontroller = Get.put(HomeController());
  final homecontroler = Get.put(HomescreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            onTap: (value) {
              homecontroller.pageindex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundcolor,
            currentIndex: homecontroller.pageindex.value,
            selectedItemColor: buttonColor,
            unselectedItemColor: Colors.white30,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Customicon.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Customicon.search), label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(Customicon.comment), label: "message"),
              BottomNavigationBarItem(
                  icon: Icon(Customicon.user), label: "profile"),
            ]);
      }),
      body: Obx(
        (() {
          return pages[homecontroller.pageindex.value];
        }),
      ),
    );
  }
}
