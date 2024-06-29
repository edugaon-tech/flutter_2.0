import 'dart:convert';

import 'package:flutter_learn_bipul/models/news/news_model.dart';
import 'package:flutter_learn_bipul/views/utils/constants/apis.dart';
import 'package:http/http.dart' as http;

class NewsController {
  Future<List<Article>> getIndianNews() async {
    var articles = <Article>[];
    var url = Uri.parse("$BASE_URL$MID_URL$API_KEY");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var data = NewsModel.fromJson(responseData);
        for (var article in data.articles ?? List<Article>.empty()) {
          if (article.author != null && article.description != null) {
            articles.add(article);
          }
        }
        return articles;
      } else {
        return List<Article>.empty();
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
