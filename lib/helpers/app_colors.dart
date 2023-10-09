import 'package:flutter/material.dart';

class AppColors {
  static const Color appBarColorDark = Color(0xFF1F2C34);

  static const Color appBarColorLight = Color(0xFF008069);
  static const Color primaryColorDark = Color(0xFF3AB69B);
  static const Color primaryColorLight = Color(0xFF027F69);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color subtitleColor = Color(0xFF84939A);
  static const Color backgroundColorDark = Color(0xFF121B22);
  static const Color backgroundColorLight = Color(0xFFFFFFFF);
  static const Color dividerColorDark = Colors.white10;

  static Color getAppBarColor(ThemeData theme) {
    return theme.brightness == Brightness.dark
        ? appBarColorDark
        : appBarColorLight;
  }

  static Color getBackgroundColor(ThemeData theme) {
    return theme.brightness == Brightness.dark
        ? backgroundColorDark
        : backgroundColorLight;
  }

  static Color getPrimaryColor(ThemeData theme) {
    return theme.brightness == Brightness.dark
        ? primaryColorDark
        : primaryColorLight;
  }
}
