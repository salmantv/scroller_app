import 'dart:io';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ConfermationscreenController extends GetxController {
  late VideoPlayerController controller;

  Future<void> videoPlaying(File videoFile) async {
    controller = VideoPlayerController.file(videoFile);
    update();
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
