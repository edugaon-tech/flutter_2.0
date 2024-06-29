import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/controllers/news/news_controller.dart';
import 'package:flutter_learn_bipul/models/news/news_model.dart';
import 'package:flutter_learn_bipul/views/utils/sizes.dart';

class NewsWidgets {
  BuildContext context;

  NewsWidgets({required this.context});
  var newsController = NewsController();

  Widget newsListView(){
    return FutureBuilder(future: newsController.getIndianNews(), builder: (_,snap){
      var data = snap.data ?? List<Article>.empty();
      if(!snap.hasData){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.separated(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return _newsItemView(data[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      }
    });
  }

  Widget _newsItemView(Article data) {
    var h = AppSizes(context: context).getHeight;
    var w = AppSizes(context: context).getWidth;
    return Column(
      children: [
        Image.network(
        data.urlToImage.toString(),
          width: w,
          height: h / 3,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data.description.toString(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
