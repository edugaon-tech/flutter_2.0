import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_learn_bipul/apis/weather/history/weather_history_model.dart';
import 'package:http/http.dart' as http;

import 'weather_history_model.dart';

class HistoryWeatherScreen extends StatefulWidget {
  const HistoryWeatherScreen({super.key});

  @override
  State<HistoryWeatherScreen> createState() => _HistoryWeatherScreenState();
}

class _HistoryWeatherScreenState extends State<HistoryWeatherScreen> {
List<Hour> hours = List<Hour>.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            getHistoryData();
          }, child: Text("Get Data")),
          Expanded(child: ListView.builder(
              itemCount: hours.length,
              itemBuilder: (_,index){
                return Card(
                  child: Column(
                    children: [
                      Text("Date : ${hours[index].time}"),
                      Divider(thickness: 2,),
                      Text("Temprature : "),
                      Image.network("https:${hours[index].condition?.icon}")
                    ],
                  ),
                );
              }))

        ],
      ),
    );
  }

 getHistoryData()async{
    var response = await http.get(Uri.parse("http://api.weatherapi.com/v1/history.json?key=139d92816b2c4eeea9194550240506&q=25.97441802520086, 84.92724334724149&dt=2024-01-06"));
    if(response.statusCode == 200){
      print("why: ${response.reasonPhrase}");
      var resData = jsonDecode(response.body);
      var data =  HistoryWeatherModel.fromJson(resData);
      print("mybody ${response.body}");
      // print(data);
      setState(() {
        hours = data.forecast?.forecastday?.first.hour??List<Hour>.empty();
        // print(hours);
      });
    }else{
      print("why: ${response.reasonPhrase}");
      return HistoryWeatherModel();
    }
  }
}
