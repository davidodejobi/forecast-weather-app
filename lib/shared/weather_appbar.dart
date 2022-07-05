import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../constant/paddings.dart';

PreferredSizeWidget createWeatherAppBar(
  BuildContext context, {
  bool showBackButton = false,
  bool showMenuButton = false,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Row(
            children: [
              if (showBackButton)
                InkWell(
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: greyColor,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              const Spacer(),
              if (showMenuButton)
                InkWell(
                  child: Icon(
                    Icons.menu,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    const snackBar = SnackBar(
                      content: Text('Yay! It\'s coming up soon!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
