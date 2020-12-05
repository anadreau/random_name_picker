import 'package:flutter/material.dart';
import 'package:random_name_picker/components/video_player.dart';

class Screen2 extends StatelessWidget {
  //Currently video player is not supported in Windows environment.
  static const String id = 'video_player';
  @override
  Widget build(BuildContext context) {
    return BackgroundVideo();
  }
}
