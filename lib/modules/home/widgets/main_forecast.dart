import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MainForecast extends StatelessWidget {
  const MainForecast({
    Key? key,
    required this.size,
    required this.temperature,
    required this.selectedDayName,
    required this.conditionIcon,
  }) : super(key: key);

  final String selectedDayName;
  final double temperature;
  final String conditionIcon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedDayName,
            style: Theme.of(context).textTheme.headline4!,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WebsafeSvg.asset(
                'assets/svg/$conditionIcon.svg',
                width: 70.0,
                height: 70.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                '${temperature.round()}°',
                // '${37}°',
                style: Theme.of(context).textTheme.headline1!,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Sunny',
            style: Theme.of(context).textTheme.subtitle1!,
          ),
        ],
      ),
    );
  }
}
