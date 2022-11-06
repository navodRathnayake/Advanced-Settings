import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:setting/Database/sqflite_helper.dart';

class UIModel with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode thememode;
  UIModel({required this.thememode});
  ThemeMode getThemeMode() => thememode;

  Future<int> getUpdateDB(String mode) async {
    var result = await SqfliteHelper.instance.updateMode(mode);
    return result;
  }

  void toggleAction(bool isOn) {
    if (isOn) {
      getUpdateDB('1');
      thememode = ThemeMode.dark;
    } else if (!isOn) {
      getUpdateDB('0');
      thememode = ThemeMode.light;
    }
    notifyListeners();
  }

  bool isOn() {
    if (thememode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}
