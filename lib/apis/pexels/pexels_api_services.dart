import 'dart:convert';

import 'package:flutter_learn_bipul/apis/pexels/pexel_video_model.dart';
import 'package:http/http.dart' as http;

class PexelApiServices{

  var _BASE_URL = "https://api.pexels.com/videos/";
  var _API_KEY = "m34MpzuaB09n4KqcXZXf60iEthoSVU2Ao0QBH7nQbMVLMbbE5mf93JP0";
  var _popularEndPoint = "popular";
  var _searchEndPoint = "search?query=";
  var _detailsEndPoint = "videos/";

  Future<PexelVideoModel>getPopularVideo()async{
    var url = Uri.parse(_BASE_URL+_popularEndPoint);
    var headers = {"Authorization":_API_KEY};
    var response = await http.get(url,headers: headers);
    if(response.statusCode == 200){
      var resData = jsonDecode(response.body);
      return PexelVideoModel.fromJson(resData);
    }else{
      return PexelVideoModel();
    }
  }



}