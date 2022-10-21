import 'package:flutter/material.dart';
import 'package:setting/Activity/HomeActivity.dart';

void main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Advanced Settings',
        theme: ThemeData(),
        darkTheme: ThemeData(),
        themeMode: ThemeMode.system,
        home: const HomeActivity(),
        debugShowCheckedModeBanner: false);
  }
}
