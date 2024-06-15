import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/pexels/pexel_video_model.dart';
import 'package:flutter_learn_bipul/apis/pexels/pexels_api_services.dart';
import 'package:flutter_learn_bipul/apis/pexels/search_video_screen.dart';
import 'package:flutter_learn_bipul/apis/pexels/videos_view_widgets.dart';

class PopularVideosScreen extends StatelessWidget {
  const PopularVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular videos"),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchVideoScreen()));
        }, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder(
          future: PexelApiServices().getPopularVideo(),
          builder: (_, snap) {
            var videos = snap.data?.videos ?? List<Video>.empty();
            return VideosViewWidgets(videos: videos);
          }),
    );
  }
}
