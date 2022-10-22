import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/Custom%20Widgets/CustomizedSettingsIcon.dart';
import 'package:setting/Custom%20Widgets/Vertical&HorizontalSpace.dart';
import 'package:setting/Models/UIModel.dart';
import 'package:setting/Theme/UIThemeMode.dart';

import '../Database/sqfliteHelper.dart';

class HomeActivity extends StatefulWidget {
  ThemeData themedata;
  HomeActivity({super.key, required this.themedata});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  Future<int> themeModeData() async {
    var result = await SqfliteHelper.instance.readMode();
    print(result);
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        if (themeModeData() == 1) {
          Provider.of<UIModel>(context, listen: false).toggleAction(true);
        } else if (themeModeData() == 0) {
          Provider.of<UIModel>(context, listen: false).toggleAction(false);
        }
      }),
    );
  }
}
