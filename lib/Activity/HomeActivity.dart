import 'package:flutter/material.dart';
import 'package:setting/Custom%20Widgets/CustomizedSettingsIcon.dart';
import 'package:setting/Custom%20Widgets/Vertical&HorizontalSpace.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
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
                        Text('flutter-sqflite database'),
                      ],
                    ),
                  ),
                  CustomizedSettingsIcon(
                    themedata: themedata,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
