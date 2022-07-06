import 'package:flutter/material.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/modules/details/provider/details_provider.dart';
import 'package:weather_app/shared/weather_appbar.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constant/paddings.dart';
import '../../core/utils/theme.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors base = Theme.of(context).extension<MyColors>()!;
    DetailProvider detailProvider = getIt<DetailProvider>();
    return Scaffold(
      appBar: createWeatherAppBar(
        context,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Next ${detailProvider.week.length} days',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: base.colour,
                    fontSize: 35,
                  ),
            ),
            const SizedBox(height: 40),
            Expanded(
                child: ListView.builder(
              itemCount: detailProvider.week.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Text(
                        detailProvider.week[index],
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: base.colour,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              // fontSize: 20,
                            ),
                      ),
                      const Spacer(),
                      WebsafeSvg.asset(
                        'assets/svg/${detailProvider.weekIcon[index]}.svg',
                        width: 32.0,
                        height: 32.0,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '${detailProvider.weekTemp[index].round()}°',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: base.colour,
                              fontSize: 18,
                            ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
