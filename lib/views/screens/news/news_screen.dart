import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/views/screens/news/news_widgets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var view = NewsWidgets(context: context);
    return Scaffold(
      body: view.newsListView(),
    );
  }
}
