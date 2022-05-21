import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  ThemeData currentTheme;

  PreferencesProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();

    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();

    notifyListeners();
  }
}
