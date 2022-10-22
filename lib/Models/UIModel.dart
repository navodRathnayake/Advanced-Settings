import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:setting/Database/sqfliteHelper.dart';

class UIModel with ChangeNotifier, DiagnosticableTreeMixin {
  static ThemeMode _thememode = ThemeMode.dark;

  ThemeMode getThemeMode() => _thememode;

  Future<int> getUpdateDB(String mode) async {
    var result = await SqfliteHelper.instance.updateMode(mode);
    print('result : ' + result.toString() + '\nmode : ' + mode);
    return result;
  }

  void toggleAction(bool isOn) {
    if (isOn) {
      getUpdateDB('1');
      print('upgraded to dark mode');
      _thememode = ThemeMode.dark;
    } else if (!isOn) {
      getUpdateDB('0');
      print('upgraded to light mode');
      _thememode = ThemeMode.light;
    }
    notifyListeners();
  }

  bool isOn() {
    if (_thememode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}
