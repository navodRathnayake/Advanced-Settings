import 'package:flutter/material.dart';
import 'package:setting/Custom%20Widgets/customized_settings_icon.dart';
import 'package:setting/Custom%20Widgets/verticle_and_horizontal_space.dart';

import '../Database/sqflite_helper.dart';

// ignore: must_be_immutable
class HomeActivity extends StatefulWidget {
  ThemeData themedata;
  HomeActivity({super.key, required this.themedata});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  Future<int> themeModeData() async {
    var result = await SqfliteHelper.instance.readMode();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themedata = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Advanced Settings UI',
                            style: themedata.textTheme.headline1),
                        const Text('flutter-sqflite database'),
                      ],
                    ),
                  ),
                  CustomizedSettingsIcon(
                    themedata: themedata,
                  )
                ],
              ),
              const VerticalSpace(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
