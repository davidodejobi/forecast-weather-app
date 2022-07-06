// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/home/home.dart';
import 'package:weather_app/modules/home/widgets/buttons.dart';
import 'package:weather_app/modules/home/widgets/forecast_date_location.dart';
import 'package:weather_app/modules/home/widgets/main_forecast.dart';
import 'package:weather_app/modules/home/widgets/mini_cards.dart';

void main() {
  testWidgets('Check if widgets are on the screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // this isn't running because of DI package get_it
    await tester.pumpWidget(const Home());

    final findDateLocation = find.byWidget(const ForecastDateLocation());
    final findMainForecast = find.byWidget(const MainForecast(
      conditionIcon: 'sunny',
      size: Size(100, 100),
      selectedDayName: 'Today',
      temperature: 20,
      weatherDescription: 'Sunny',
    ));
    final miniCards = find.byWidget(const MiniCards(
      conditionIcon: [],
      temperature: [],
      time: [],
    ));
    final findButtons = find.byWidget(const ListOfButtons());

    expect(findDateLocation, findsOneWidget);
    expect(findMainForecast, findsOneWidget);
    expect(miniCards, findsOneWidget);
    expect(findButtons, findsOneWidget);
  });
}
