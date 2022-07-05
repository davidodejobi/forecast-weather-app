import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MiniCards extends StatelessWidget {
  const MiniCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
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
                  '${9} AM',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 8.0),
                WebsafeSvg.asset(
                  'assets/svg/sunny.svg',
                  width: 32.0,
                  height: 32.0,
                ),
                const SizedBox(height: 8.0),
                Text('${26}°', style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          );
        });
  }
}
