import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/pexels/pexel_video_model.dart';
import 'package:flutter_learn_bipul/apis/pexels/pexels_api_services.dart';
import 'package:flutter_learn_bipul/apis/pexels/videos_view_widgets.dart';

class SearchVideoScreen extends StatefulWidget {
  const SearchVideoScreen({super.key});

  @override
  State<SearchVideoScreen> createState() => _SearchVideoScreenState();
}

class _SearchVideoScreenState extends State<SearchVideoScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (text){
            setState(() {

            });
          },
        ),
      ),
      body: searchController.text.isNotEmpty? FutureBuilder(
          future: PexelApiServices().getPopularVideo(),
          builder: (_, snap) {
            var videos = snap.data?.videos ?? List<Video>.empty();
            return VideosViewWidgets(videos: videos);
          }):const Center(
        child: Text("Search your need"),
      ),
    );
  }
}
