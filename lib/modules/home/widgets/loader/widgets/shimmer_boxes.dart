import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'shimmer_animation.dart';

Widget buildSubMiddleCard(bool isLoading) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Row(
      children: [
        Container(
          height: 10,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16.0),
        Container(
          height: 10,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16.0),
        Container(
          height: 10,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget buildMiddleCards(
  int ri,
  BuildContext context,
  bool isLoading,
  dynamic randomSvg,
) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WebsafeSvg.asset(
              'assets/svg/$randomSvg.svg',
              width: 70.0,
              height: 70.0,
            ),
            const SizedBox(width: 8.0),
            Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '°',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          height: 10,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget buildTopCard(bool isLoading) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //container for shimmer
        Container(
          height: 20,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 20,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 10,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    ),
  );
}

Widget buildButtomShimmercards(
  int ri,
  BuildContext context,
  bool isLoading,
  dynamic randomSvg,
) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        WebsafeSvg.asset(
          'assets/svg/$randomSvg.svg',
          width: 32.0,
          height: 32.0,
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              height: 10,
              width: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
            Text('°', style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ],
    ),
  );
}
