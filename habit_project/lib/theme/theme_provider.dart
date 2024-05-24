import 'package:flutter/material.dart';
import 'package:habit_project/framwork/service/storage_service.dart';
import 'package:habit_project/theme/theme.dart';

class ThemeProvider with ChangeNotifier {

  ThemeData _themeData = StorageService().getInt('themeMode') == 2 ? darkMode : lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if(_themeData == lightMode) {
      themeData = darkMode;
      StorageService().setInt('themeMode', 2);
    } else {
      themeData = lightMode;
      StorageService().setInt('themeMode', 1);
    }
  }
}