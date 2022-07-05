import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/models/forecast_weather.dart';
import '../../../core/services/api_token.dart';
import '../../../core/services/base_api.dart';

class HomeProvider with ChangeNotifier {
  getWeatherForeCast(
    double lat,
    double lng,
  ) async {
    try {
      var response = await connect(
          "forecast?lat=$lat&lon=$lng&units=metric&appid=$apiKey");
      var data = json.decode(response.body);

      log('response: $response');
      var weather = ForecastWeather.fromJson(data);

      List tempList = [];

      for (var i = 0; i < weather.list!.length; i++) {
        tempList.add(weather.list![i]);
      }

      print('tempList: ${tempList.toString()}');

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
