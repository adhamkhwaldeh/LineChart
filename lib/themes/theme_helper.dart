import 'package:enpal_assignment/themes/dark_theme.dart';
import 'package:enpal_assignment/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

MaterialColor hexColor2MaterialColor({Color? color, int? hexColor}) {
  final lColor = color ?? Color(hexColor!);
  final lHexColor = hexColor ?? colorToInt(colorToHex(lColor));

  final r = lColor.r;
  final g = lColor.g;
  final b = lColor.b;

  return MaterialColor(
    lHexColor,
    <int, Color>{
      50: Color.from(alpha: 0.1, red: r, green: g, blue: b),
      100: Color.from(alpha: 0.2, red: r, green: g, blue: b),
      200: Color.from(alpha: 0.3, red: r, green: g, blue: b),
      300: Color.from(alpha: 0.4, red: r, green: g, blue: b),
      400: Color.from(alpha: 0.5, red: r, green: g, blue: b),
      500: Color.from(alpha: 0.6, red: r, green: g, blue: b),
      600: Color.from(alpha: 0.7, red: r, green: g, blue: b),
      700: Color.from(alpha: 0.8, red: r, green: g, blue: b),
      800: Color.from(alpha: 0.9, red: r, green: g, blue: b),
      900: Color.from(alpha: 1, red: r, green: g, blue: b),
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
  return color.toHex();
}

int colorToInt(String hexColor) {
  var lHexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (lHexColor.length == 6) {
    lHexColor = 'FF$lHexColor';
  }

  return int.parse(lHexColor, radix: 16);
}

Color iconColor = Get.isDarkMode ? Colors.white : Get.theme.primaryColor;
