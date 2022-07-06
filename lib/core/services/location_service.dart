import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/modules/home/provider/home_provider.dart';

import '../../locator.dart';

class LocationService with ChangeNotifier {
  final HomeProvider _homeProvider = getIt<HomeProvider>();

  late double _longitude;
  late double _latitude;
  late String _currentLocality;
  late String _currentCountry;

  String get currentLocality => _currentLocality;
  String get currentCountry => _currentCountry;

  Future<Position> getCurrentPosition(int selectedDay) async {
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      _latitude = position.latitude;
      _longitude = position.longitude;

      await _homeProvider.getWeatherForeCast(
          _latitude, _longitude, selectedDay);

      await _getAddressFromLatLng();
      notifyListeners();
      return position;
    });
  }

  Future getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        log("'Location permissions are permanently denied");
      } else {
        log("GPS Location service is granted");
      }
    } else {
      log("GPS Location permission granted.");
      return permission;
    }
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(_latitude, _longitude);

      Placemark place = placemarks[0];

      _currentLocality = place.locality!;
      _currentCountry = place.country!;
    } catch (e) {
      print(e);
    }
  }
}
