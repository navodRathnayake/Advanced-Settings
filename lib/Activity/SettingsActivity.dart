import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/Custom%20Widgets/Vertical&HorizontalSpace.dart';
import 'package:setting/Models/UIModel.dart';

class SettingsActivty extends StatefulWidget {
  final ThemeData themedata;
  bool isSelected = false;
  SettingsActivty({super.key, required this.themedata});

  @override
  State<SettingsActivty> createState() => _SettingsActivtyState();
}

class _SettingsActivtyState extends State<SettingsActivty> {
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
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: themedata.primaryColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Settings',
                    style: themedata.textTheme.headline1,
                  )
                ],
              ),
              const VerticalSpace(height: 30),
              const Divider(),
              ListTile(
                leading: Icon(Icons.dark_mode, color: themedata.primaryColor),
                title: Text(
                  'Dark Mode ON / OFF',
                  style: themedata.textTheme.headline2,
                ),
                subtitle: Text(
                  'Change Your UI Theme',
                  style: themedata.textTheme.titleSmall,
                ),
                trailing: Switch(
                  value: Provider.of<UIModel>(context).isOn(),
                  onChanged: (value) {
                    // setState(() {
                    //   widget.isSelected = !widget.isSelected;
                    // });
                    Provider.of<UIModel>(context, listen: false)
                        .toggleAction(value);
                  },
                  activeColor: themedata.secondaryHeaderColor,
                ),
              ),
              const Divider(),
              const VerticalSpace(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
