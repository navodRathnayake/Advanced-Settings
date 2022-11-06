import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomizedSettingsIcon extends StatelessWidget {
  ThemeData themedata;
  CustomizedSettingsIcon({super.key, required this.themedata});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: themedata.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        icon: Icon(
          Icons.settings,
          color: themedata.primaryColor,
          size: 30,
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'settings');
        },
      ),
    );
  }
}
