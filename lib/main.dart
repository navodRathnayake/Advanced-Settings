import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/Activity/home_activity.dart';
import 'package:setting/Activity/settings_activity.dart';
import 'package:setting/Models/ui_model.dart';
import 'package:setting/Theme/ui_theme_mode.dart';

import 'Database/sqflite_helper.dart';

Future<void> main() async {
  ThemeMode mode;
  WidgetsFlutterBinding.ensureInitialized();
  mode = await getThemeMode();
  runApp(MyApp(
    themeMode: mode,
  ));
}

Future<ThemeMode> getThemeMode() async {
  final int result = await SqfliteHelper.instance.readMode();
  final ThemeMode themeMode = result == 1 ? ThemeMode.dark : ThemeMode.light;
  return themeMode;
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    ThemeData themedata = Theme.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UIModel(thememode: themeMode),
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
