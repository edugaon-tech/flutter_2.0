import 'dart:convert';

import 'package:flutter_learn_bipul/apis/weather/current/current_weather_model.dart';
import 'package:http/http.dart' as http;

import 'history/weather_history_model.dart';

class WeatherApiService {
  var BASE_URL = "http://api.weatherapi.com/v1/";
  var API_KEY = "139d92816b2c4eeea9194550240506";
  var currentEdnPoint = "current.json";
  var historyEndPoint = "history.json";

  Future<CurrentWeatherModel> getCurrentWeather(String query) async {
    try {
      var url = Uri.parse("$BASE_URL$currentEdnPoint?key=$API_KEY&q=$query");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        return CurrentWeatherModel.fromJson(resData);
      } else {
        return CurrentWeatherModel();
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<HistoryWeatherModel>getHistoryData(String query)async{
    var response = await http.get(Uri.parse("$BASE_URL$historyEndPoint?key=$API_KEY&q=$query&dt=2024-06-09"));
    if(response.statusCode == 200){
      var resData = jsonDecode(response.body);
      return HistoryWeatherModel.fromJson(resData);
    }else{
      return HistoryWeatherModel();
    }
  }
}
