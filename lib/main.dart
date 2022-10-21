import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:setting/Activity/HomeActivity.dart';
import 'package:setting/Theme/UIThemeMode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
        title: 'Advanced Settings',
        theme: UIThemeMode.lightTheme(screenWidth),
        darkTheme: UIThemeMode.darkTheme(screenWidth),
        themeMode: ThemeMode.light,
        home: const HomeActivity(),
        debugShowCheckedModeBanner: false);
  }
}
