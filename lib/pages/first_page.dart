
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // late VideoPlayerController _playerController;

  @override
  void initState() {
    super.initState();
    // _playerController = VideoPlayerController.network('assets/video/4dsk.mp4')
    //   ..addListener(() {
    //    print(_playerController.value);
    //   })
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //     setState(() {
    //       _playerController.play();
    //     });
    //   });
  }

  @override
  void dispose() {
    // _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 800,
      //   height: 800,
        child: Column(children:
        [
      // if (_playerController.value.isInitialized)
      //   AspectRatio(
      //     aspectRatio: _playerController.value.aspectRatio,
      //     child: VideoPlayer(_playerController),
      //   ),
      // VideoProgressIndicator(_playerController, allowScrubbing: true),
    ]));
  }
}
