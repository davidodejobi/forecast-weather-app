import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_color.dart';
import '../../details/details.dart';
import '../provider/button_provider.dart';

// HomeProvider _homeProvider = getIt<HomeProvider>();

class ListOfButtons extends StatelessWidget {
  const ListOfButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<ButtonProvider>(context);
    return Row(
      children: [
        Button(
          color: buttonProvider.button1 ? Colors.white : greyColor,
          text: 'Today',
          onPressed: () {
            buttonProvider.switcher(0);
          },
        ),
        const SizedBox(width: 16.0),
        Button(
          color: buttonProvider.button2 ? Colors.white : greyColor,
          text: 'Tomorrow',
          onPressed: () {
            buttonProvider.switcher(1);
          },
        ),
        const SizedBox(width: 16.0),
        Button(
          color: buttonProvider.button3 ? Colors.white : greyColor,
          text: 'Next 5 days',
          hasIcon: true,
          onPressed: () {
            buttonProvider.switcher(2);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Details(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final bool hasIcon;
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const Button({
    required this.onPressed,
    required this.text,
    required this.color,
    this.hasIcon = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonProvider = Provider.of<ButtonProvider>(context);
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4.0),
          if (hasIcon)
            Icon(
              Icons.arrow_forward_outlined,
              size: 18,
              color: buttonProvider.button3 ? Colors.white : greyColor,
            ),
        ],
      ),
    );
  }
}
