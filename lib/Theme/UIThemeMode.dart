import 'package:flutter/material.dart';
import 'package:setting/Theme/TextTheme.dart';

class UIThemeMode {
  static ThemeData lightTheme(double screenWidth) {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: screenWidth < 750 ? smallLight : defaultDark,
      primaryColor: Colors.black,
      secondaryHeaderColor: Colors.amber,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  static ThemeData darkTheme(double screenWidth) {
    return ThemeData(
        brightness: Brightness.dark,
        textTheme: screenWidth < 750 ? smallDark : defaultDark,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white));
  }
}
