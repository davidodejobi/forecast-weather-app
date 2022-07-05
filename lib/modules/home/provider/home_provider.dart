import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/modules/home/provider/button_provider.dart';

import '../../../core/models/forecast_weather.dart';
import '../../../core/services/api_token.dart';
import '../../../core/services/base_api.dart';
import '../../../locator.dart';

class HomeProvider with ChangeNotifier {
  final ButtonProvider _buttonProvider = getIt<ButtonProvider>();
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
      _temperature = chunkedTemp[_buttonProvider.selectedDay];

      List chunkedTime = dataChunker(timeList);
      _time = chunkedTime[_buttonProvider.selectedDay];

      List chunkedWeatherIcon = dataChunker(weatherIcon);
      _conditionIcon = chunkedWeatherIcon[_buttonProvider.selectedDay];

      List chunkedWeatherDesc = dataChunker(weatherDesc);
      _weatherDescription = chunkedWeatherDesc[_buttonProvider.selectedDay];
      log('_weatherDescription: $_weatherDescription');

      notifyListeners();
      return weather;
    } catch (e) {
      log(e.toString());
    }
  }

  List<dynamic> dataChunker(List items) {
    var chunkOfTime = [];
    int chunkSize = 8;
    for (var i = 0; i < items.length; i += chunkSize) {
      chunkOfTime.add(items.sublist(
          i, i + chunkSize > items.length ? items.length : i + chunkSize));
    }
    notifyListeners();
    return chunkOfTime;
  }

  String timeConverter(int time) {
    var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    var formatter = DateFormat.j();
    var formatted = formatter.format(date);
    notifyListeners();
    return formatted;
  }

  //check weather condition and assign a icon
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'tstorm';
    } else if (condition >= 300 && condition < 400) {
      return 'chancesleet';
    } else if (condition >= 400 && condition < 600) {
      return 'rain';
    } else if (condition >= 600 && condition <= 700) {
      return 'snow';
    } else if (['800', '801'].contains(condition.toString())) {
      return 'sunny';
    } else if (['803', '804'].contains(condition.toString())) {
      return 'cloudy';
    } else {
      return 'partlycloudy';
    }
  }
}
