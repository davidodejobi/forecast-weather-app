import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.colour,
  });

  final Color? colour;

  @override
  MyColors copyWith({
    Color? colour,
  }) {
    return MyColors(
      colour: colour ?? this.colour,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      colour: Color.lerp(colour, other.colour, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $colour)';
}

class WeatherTheme with ChangeNotifier {
  static ThemeData light(Color color, bool material3) {
    return ThemeData.light().copyWith(
      primaryColor: material3 ? color : null,
      useMaterial3: material3,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardTheme(
        color: Color(0xFF75A0FF),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 27.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 22.0,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF242A36),
          fontWeight: FontWeight.w400,
        ),
      ),
      colorScheme: material3 ? ColorScheme.fromSeed(seedColor: color) : null,
      extensions: <ThemeExtension<dynamic>>[
        const MyColors(
          colour: Color(0xFF00296B),
        ),
      ],
    );
  }
}
