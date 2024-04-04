import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum AppThemeType { unregisterUser, registerUser, premiumUser, darkTheme }

class ThemeService {

  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode getThemeMode() {
    var mode = _loadThemeFromBox();
    if (mode == AppThemeType.premiumUser.index ||
        mode == AppThemeType.registerUser.index) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  int _loadThemeFromBox() => _box.read(_key) ?? 0;

  /// Save isDarkMode to local storage
  _saveThemeToBox(int model) => _box.write(_key, model);

  void switchTheme(int value) {
    var themeMode = ThemeMode.light;
    var themeData = getLightTheme();

    if (value == AppThemeType.premiumUser.index ||
        value == AppThemeType.registerUser.index)  {
      themeMode = ThemeMode.light;
      themeData = getLightTheme();
    } else {
      themeMode = ThemeMode.dark;
      themeData = getDarkTheme();
    }

    Get.changeThemeMode(themeMode);
    Get.changeTheme(themeData);
    _saveThemeToBox(value);
  }

  static ThemeData getLightTheme() {
    return ThemeData.light();
  }

  static ThemeData getDarkTheme() {
    return ThemeData.dark();
  }
}
