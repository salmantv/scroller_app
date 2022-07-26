import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/icons/icons.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/homescreen/views/homescreen_view.dart';

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
              if (value == 2) {
                HomescreenView().openBottomSheet();
              }
              homecontroller.pageindex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black45,
            currentIndex: homecontroller.pageindex.value,
            selectedItemColor: buttonColor,
            unselectedItemColor: Colors.white30,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 25,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Customicon.home, size: 25),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Customicon.search,
                    size: 25,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, right: 12),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Customicon.user,
                    size: 25,
                  ),
                  label: "Profile"),
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
