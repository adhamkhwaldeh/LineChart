import 'package:enpal_assignment/themes/dark_theme.dart';
import 'package:enpal_assignment/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MaterialColor hexColor2MaterialColor({Color? color, int? hexColor}) {
  final lColor = color ?? Color(hexColor!);
  final lHexColor = hexColor ?? colorToInt(colorToHex(lColor));

  final r = lColor.red;
  final g = lColor.green;
  final b = lColor.blue;

  return MaterialColor(
    lHexColor,
    <int, Color>{
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    },
  );
}

ThemeData getAppThemeFromThemeMode(ThemeMode mode) {
  if (mode == ThemeMode.light) {
    return LightTheme.themeData;
  }

  return DarkTheme.themeData;
}

bool isDarkMode() {
  // final brightness = MediaQuery.of(context).platformBrightness;
  return Get.isPlatformDarkMode; //brightness == Brightness.dark;
}

/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
String colorToHex(Color color, {bool leadingHashSign = false}) {
  final r = color.red;
  final g = color.green;
  final b = color.blue;
  final a = color.alpha;
  return '${leadingHashSign ? '#' : ''}'
      '${a.toRadixString(16).padLeft(2, '0')}'
      '${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
}

int colorToInt(String hexColor) {
  var lHexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (lHexColor.length == 6) {
    lHexColor = 'FF$lHexColor';
  }

  return int.parse(lHexColor, radix: 16);
}

Color iconColor = Get.isDarkMode ? Colors.white : Get.theme.primaryColor;
