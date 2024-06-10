import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/weather/current/current_weather_model.dart';
import 'package:flutter_learn_bipul/apis/weather/history/weather_history_model.dart';
import 'package:flutter_learn_bipul/apis/weather/weather_api_service.dart';
import 'package:intl/intl.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  var currentData = CurrentWeatherModel();
  var hours = List<Hour>.empty();

  getCurrentData(String? query) async {
    currentData = await WeatherApiService().getCurrentWeather(query ?? "Bihar");
    var history = await WeatherApiService().getHistoryData(query ?? "Bihar");
    hours = history.forecast?.forecastday?.first.hour ?? List<Hour>.empty();
    setState(() {
      print(
          "current: $currentData Hour:${history.forecast?.forecastday?.first.hour}");
    });
  }

  @override
  void initState() {
    getCurrentData("Bihar");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search location...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1, color: Colors.black))),
                onChanged: (query) {
                  getCurrentData(query);
                },
              ),
            ),
            Expanded(
                child: currentData.location == null
                    ? const Center(
                        child: Text("Can't find location"),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.red.withOpacity(.5),
                            child: Text(
                              "${currentData.current!.tempC} C",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Location",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                    Text(
                                      "${currentData.location?.name},${currentData.location?.country}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Location: ${currentData.location?.lat}, ${currentData.location?.lon}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11),
                                    ),
                                    Text(
                                      "Date: ${currentData.location?.localtime}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Card(
                            child: Column(
                              children: [
                                Text(
                                  "Yesterday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                        itemCount: hours.length,
                                        itemBuilder: (_, index) {
                                          return SizedBox(height: 100,width: 200,child: ListTile(
                                            subtitle: Text(
                                                "${hours[index].condition?.text} (${hours[index].tempC}C)"),
                                            leading: Image.network(
                                                "http:${hours[index].condition?.icon}"),
                                            title: Text(getTime(
                                                "${hours[index].time}")),
                                          ),);
                                        }))
                              ],
                            ),
                          ))
                        ],
                      ))
          ],
        ),
      ),
    );
  }

  getTime(String date) {
    var format = DateFormat("hh:mm a");
    return format.format(DateTime.parse(date));
  }
}
