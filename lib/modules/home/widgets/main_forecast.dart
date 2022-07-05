import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MainForecast extends StatelessWidget {
  const MainForecast({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Today',
            style: Theme.of(context).textTheme.headline4!,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WebsafeSvg.asset(
                'assets/svg/cloudy.svg',
                width: 70.0,
                height: 70.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                '${37}°',
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
