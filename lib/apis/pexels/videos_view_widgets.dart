import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/pexels/pexel_video_model.dart';
import 'package:flutter_learn_bipul/apis/pexels/video_details_screen.dart';
import 'package:flutter_learn_bipul/apis/pexels/video_player_screen.dart';

class VideosViewWidgets extends StatefulWidget {
  final List<Video> videos;
  const VideosViewWidgets({super.key, required this.videos});

  @override
  State<VideosViewWidgets> createState() => _VideosViewWidgetsState();
}

class _VideosViewWidgetsState extends State<VideosViewWidgets> {
  @override
  Widget build(BuildContext context) {
    return creatorAndVideoView(widget.videos);
  }

  Widget creatorAndVideoView(List<Video> videos) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: videos.length,
        itemBuilder: (_, index) {
          var items = videos[index].videoFiles??List<VideoFile>.empty();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videos[index].user!.name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 180,
                  // width: 250,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>VideoDetailsScreen()));
                        },
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.black),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          // child: Container(
                          //   height: 200,
                          //   width: 250,
                          //   color: Colors.grey,
                          // ),

                          child: VideoPlayerScreen(url:items[index].link.toString(),isMainView: false,),
                          // child: ,
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10,);
                  },),
                )
              ],
            ),
          );
        });
  }
}
