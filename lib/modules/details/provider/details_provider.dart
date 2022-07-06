import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/models/forecast_weather.dart';
import '../../../core/services/api_token.dart';
import '../../../core/services/base_api.dart';
import '../../../shared/helper_function.dart';

class DetailProvider with ChangeNotifier {
  DetailProvider() {
    getWeek(DateFormat.EEEE().format(DateTime.now()));
  }
  final List<String> _week = [];
  List _weekIcon = [];
  List _weekTemp = [];

  List<String> get week => _week;
  List get weekIcon => _weekIcon;
  List get weekTemp => _weekTemp;

  Future getFiveDaysWeatherForeCast(
    double lat,
    double lng,
  ) async {
    try {
      var response = await connect(
          "forecast?lat=$lat&lon=$lng&units=metric&appid=$apiKey");
      var data = json.decode(response.body);

      var weather = ForecastWeather.fromJson(data);

      List tempList = [];
      List weatherIcon = [];

      /// Get the weather for the next 5 days
      /// by looping through the list of weather objects
      /// and getting the temperature and weather icon
      /// for each day.
      for (var i = 0; i < weather.list!.length; i += 8) {
        tempList.add(weather.list![i].main.temp);
        weatherIcon.add(getWeatherIcon(weather.list![i].weather![0].id));
      }

      _weekTemp = tempList;
      _weekIcon = weatherIcon;
      print('weatherIcon: $weatherIcon');

      notifyListeners();
      return weather;
    } catch (e) {
      log(e.toString());
    }
  }

  //check the current week of the day and return a list of weeks starting from today
  getWeek(String currentDayOfTheWeek) {
    List daysOfTheWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      if (currentDayOfTheWeek == daysOfTheWeek[i]) {
        for (var j = 0; j < 5; j++) {
          _week.add(daysOfTheWeek[i + j]);
          if (_week.length == 5) {
            print(' _week: $_week');
            return week;
          }
        }
      }
    }
  }
}
