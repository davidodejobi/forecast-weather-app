import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/theme.dart';
import 'locator.dart';
import 'modules/home/home.dart';

void main() {
  setUp();
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  final Color colorSeed = const Color(0xFF010733);
  final bool material3 = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: WeatherTheme.light(colorSeed, material3),
      home: const Home(),
    );
  }
}
