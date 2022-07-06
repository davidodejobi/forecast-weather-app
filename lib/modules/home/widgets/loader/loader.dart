import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../constant/paddings.dart';
import '../../../../shared/weather_appbar.dart';
import 'widgets/shimmer_animation.dart';
import 'widgets/shimmer_boxes.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  List<String> svgWeatherIcons = [
    'chancesleet',
    'partlycloudy',
    'tstorms',
    'snow',
    'cloudy',
    'rain',
    'sunny',
  ];

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    int ri = Random().nextInt(svgWeatherIcons.length - 1);
    Size size = MediaQuery.of(context).size;
    return Shimmer(
      linearGradient: _shimmerGradient,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createWeatherAppBar(
            context,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
            ),
            child: buildTopCard(isLoading),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: buildMiddleCards(
              ri,
              context,
              isLoading,
              svgWeatherIcons[ri],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSubMiddleCard(isLoading),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF326CEE),
                            ),
                            child: buildButtomShimmercards(ri, context,
                                isLoading, svgWeatherIcons[ri + 1]),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFFFFFFF),
    Color(0xFFCDCDCD),
    Color(0xFFFFFFFF),
  ],
  stops: [
    0.1,
    0.4,
    0.5,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
