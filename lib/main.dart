import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/Activity/HomeActivity.dart';
import 'package:setting/Activity/SettingsActivity.dart';
import 'package:setting/Models/UIModel.dart';
import 'package:setting/Theme/UIThemeMode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    ThemeData themedata = Theme.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UIModel(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Advanced Settings',
          theme: UIThemeMode.lightTheme(screenWidth),
          darkTheme: UIThemeMode.darkTheme(screenWidth),
          themeMode: Provider.of<UIModel>(context).getThemeMode(),
          home: HomeActivity(themedata: themedata),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            'settings': (context) => SettingsActivty(themedata: themedata),
            'home': (context) => HomeActivity(themedata: themedata)
          },
        );
      },
    );
  }
}
