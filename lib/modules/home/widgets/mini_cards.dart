import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../locator.dart';
import '../provider/home_provider.dart';

HomeProvider homeProvider = getIt<HomeProvider>();

class MiniCards extends StatelessWidget {
  const MiniCards({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeProvider.time.length,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  homeProvider.time[index],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 8.0),
                WebsafeSvg.asset(
                  'assets/svg/${homeProvider.conditionIcon[index]}.svg',
                  width: 32.0,
                  height: 32.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${homeProvider.temperature[index].round()}°',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          );
        });
  }
}
