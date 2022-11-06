import 'package:flutter/material.dart';
import 'package:setting/Theme/text_theme.dart';

class UIThemeMode {
  static ThemeData lightTheme(double screenWidth) {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: screenWidth < 750 ? smallLight : defaultLight,
      primaryColor: Colors.black,
      secondaryHeaderColor: Colors.grey,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  static ThemeData darkTheme(double screenWidth) {
    return ThemeData(
        brightness: Brightness.dark,
        textTheme: screenWidth < 750 ? smallDark : defaultDark,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.white));
  }
}
