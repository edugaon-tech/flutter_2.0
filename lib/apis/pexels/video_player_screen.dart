import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final bool isMainView;

  const VideoPlayerScreen(
      {super.key, required this.url, required this.isMainView});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.isMainView ? mainView() : placeHolderView(),
    );
  }

  Widget placeHolderView({double height = 200, double width = 200}) {
    return SizedBox(
      height: height,
      width: width,
      child: VideoPlayer(_controller),
    );
  }

  Widget mainView() {
    return Stack(
      children: [
        VideoPlayer(_controller),
        Positioned(
          height: 200,
          width: 250,
          child: IconButton(
              onPressed: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              },
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 45,
              )),
        )
      ],
    );
  }
}
