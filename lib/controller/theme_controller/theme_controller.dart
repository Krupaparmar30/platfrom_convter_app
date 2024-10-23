import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;
  ThemeData themeLight = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.white,
    ),
  );
  ThemeData themeDark = ThemeData(
      colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.black,
  ));

  CupertinoThemeData cupertinoThemeLight = CupertinoThemeData(
    primaryContrastingColor: Colors.white,
    primaryColor: CupertinoColors.black,
  );
  CupertinoThemeData cupertinoThemeDark = CupertinoThemeData(
    primaryContrastingColor: Colors.black,
    primaryColor: CupertinoColors.white,
  );

  void toggleTheme() {
    isDark.value = !isDark.value;
  }

  ThemeData get currentTheme {
    return isDark.value ? ThemeData.dark() : ThemeData.dark();
  }
}
