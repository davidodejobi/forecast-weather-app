import 'package:flutter/material.dart';

import '../../details/details.dart';

class ListOfButtons extends StatelessWidget {
  const ListOfButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button(
          color: Colors.white,
          text: 'Today',
          onPressed: () {},
        ),
        const SizedBox(width: 16.0),
        Button(
          color: Colors.white,
          text: 'Tomorrow',
          onPressed: () {},
        ),
        const SizedBox(width: 16.0),
        Button(
          color: Colors.white,
          text: 'Next 5 days',
          hasIcon: true,
          onPressed: () {
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
            const Icon(
              Icons.arrow_forward_outlined,
              size: 18,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
