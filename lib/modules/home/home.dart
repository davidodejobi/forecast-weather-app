import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/services/location_service.dart';

import '../../constant/paddings.dart';
import '../../locator.dart';
import '../../shared/weather_appbar.dart';
import 'provider/button_provider.dart';
import 'provider/home_provider.dart';
import 'widgets/buttons.dart';
import 'widgets/forecast_date_location.dart';
import 'widgets/mini_cards.dart';
import 'widgets/main_forecast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationService locationService = getIt<LocationService>();

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
            body: FutureBuilder(
              future: locationService.getCurrentPosition(),
              builder: (context, snapshot) {
                HomeProvider homeProvider = getIt<HomeProvider>();
                final buttonProvider = Provider.of<ButtonProvider>(context);
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      createWeatherAppBar(
                        context,
                        showMenuButton: true,
                      ),
                      const SizedBox(height: 16.0),
                      const ForecastDateLocation(),
                      MainForecast(
                        conditionIcon: homeProvider.conditionIcon.first,
                        selectedDayName: buttonProvider.selectedDayName,
                        temperature: homeProvider.temperature.first,
                        size: size,
                      ),
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
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              },
            )));
  }
}
