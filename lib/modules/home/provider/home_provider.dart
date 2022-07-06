import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/modules/home/provider/button_provider.dart';

import '../../../core/models/forecast_weather.dart';
import '../../../core/services/api_token.dart';
import '../../../core/services/base_api.dart';
import '../../../shared/helper_function.dart';

class HomeProvider with ChangeNotifier {
  ButtonProvider buttonProvider = ButtonProvider();
  List _temperature = [];
  List _time = [];
  List _conditionIcon = [];
  List _weatherDescription = [];

  List get temperature =>
      _temperature != [] ? _temperature : List.generate(8, (index) => 00);
  List get time => _time;
  List get conditionIcon => _conditionIcon != []
      ? _conditionIcon
      : List.generate(8, (index) => 'cloudy');
  List get weatherDescription => _weatherDescription;

  Future getWeatherForeCast(
    double lat,
    double lng,
    int selectedDay,
  ) async {
    try {
      var response = await connect(
          "forecast?lat=$lat&lon=$lng&units=metric&appid=$apiKey");
      var data = json.decode(response.body);

      var weather = ForecastWeather.fromJson(data);

      List tempList = [];
      List timeList = [];
      List weatherIcon = [];
      List weatherDesc = [];

      for (var i = 0; i < weather.list!.length; i++) {
        tempList.add(weather.list![i].main.temp);
        timeList.add(timeConverter(weather.list![i].dt));
        weatherIcon.add(getWeatherIcon(weather.list![i].weather![0].id));
        weatherDesc.add(weather.list![i].weather![0].main);
      }

      List chunkedTemp = dataChunker(tempList);
      _temperature = chunkedTemp[selectedDay];

      List chunkedTime = dataChunker(timeList);
      _time = chunkedTime[selectedDay];

      List chunkedWeatherIcon = dataChunker(weatherIcon);
      _conditionIcon = chunkedWeatherIcon[selectedDay];

      List chunkedWeatherDesc = dataChunker(weatherDesc);
      _weatherDescription = chunkedWeatherDesc[selectedDay];

      notifyListeners();
      return weather;
    } catch (e) {
      log(e.toString());
    }
  }
}
