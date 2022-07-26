import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/homescreen/controllers/homescreen_controller.dart';
import 'package:video_player/video_player.dart';

class VideoplayItem extends StatefulWidget {
  final homecontroller = Get.put(HomescreenController());
  var isplaying;

  VideoplayItem({Key? key, required this.videoUrl, this.isplaying})
      : super(key: key);

  String videoUrl;

  @override
  State<VideoplayItem> createState() => VideoplayItemState();
}

class VideoplayItemState extends State<VideoplayItem> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);
        if (widget.isplaying == false) {
          videoPlayerController.dispose();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomescreenController>(builder: (context) {
      return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: Colors.black),
        child: VideoPlayer(videoPlayerController),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
