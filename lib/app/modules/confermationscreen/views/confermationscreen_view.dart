import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/confermationscreen/controllers/confermationscreen_controller.dart';
import 'package:scroller/app/modules/confermationscreen/views/widget/button.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/home/views/home_view.dart';
import 'package:scroller/app/modules/postUplodingscreen/views/post_uplodingscreen_view.dart';

import 'package:video_player/video_player.dart';

class ConfermationscreenView extends StatefulWidget {
  final File videofile;
  final String videopath;

  ConfermationscreenView({required this.videofile, required this.videopath});

  @override
  State<ConfermationscreenView> createState() => _ConfermationscreenViewState();
}

class _ConfermationscreenViewState extends State<ConfermationscreenView> {
  final confermationcontroller = Get.put(ConfermationscreenController());
  @override
  void dispose() {
    confermationcontroller.controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    confermationcontroller.videoPlaying(widget.videofile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GetBuilder<ConfermationscreenController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: InkWell(
                    onTap: () {},
                    child: Builder(builder: (context) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 110,
                          child:
                              VideoPlayer(confermationcontroller.controller));
                    }),
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NextButton(
                      hintText: "Cancel",
                      circular: 30,
                      Ontap: () {
                        Get.offAll(HomeView());
                      },
                      colorbutton: buttonColor),
                  NextButton(
                      hintText: "Conform",
                      circular: 30,
                      Ontap: () {
                        if (confermationcontroller.controller == null) {
                          Get.snackbar("Somthing worge", "No video fonded");
                          return;
                        } else {
                          confermationcontroller.controller.pause();
                          Get.to(PostUplodingscreenView(
                            videofile: widget.videofile,
                            videopath: widget.videopath,
                          ));
                        }
                      },
                      colorbutton: buttonColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
