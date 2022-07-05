import 'package:flutter/material.dart';

import '../../constant/paddings.dart';
import '../../shared/weather_appbar.dart';
import 'widgets/buttons.dart';
import 'widgets/forecast_date_location.dart';
import 'widgets/mini_cards.dart';
import 'widgets/main_forecast.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xFF326CEE),
            Color(0xFF749FFE),
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createWeatherAppBar(
                context,
                showMenuButton: true,
              ),
              const SizedBox(height: 16.0),
              const ForecastDateLocation(),
              MainForecast(size: size),
              Padding(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListOfButtons(),
                    const SizedBox(height: 25.0),
                    Container(
                      height: size.height * 0.2,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: Color(0xFF75A0FF),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: kDefaultPadding,
                        ),
                        child: MiniCards(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
