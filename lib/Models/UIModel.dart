import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UIModel with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode _thememode = ThemeMode.dark;

  ThemeMode getThemeMode() => _thememode;

  void toggleAction(bool isOn) {
    if (isOn) {
      _thememode = ThemeMode.dark;
    } else if (!isOn) {
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
