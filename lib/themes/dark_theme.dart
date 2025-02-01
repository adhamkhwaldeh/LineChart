import 'package:flutter/services.dart';
import 'package:enpal_assignment/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static final MaterialColor _primarySwatch =
      hexColor2MaterialColor(hexColor: 0xFF246BB3);
  static const Color _whiteColor = Colors.white;
  static const Color _blackColor = Color(0xFF283350); //Colors.grey;
  // static const Color _primaryColor = Color.fromARGB(255, 7, 40, 73);
  static const Color _primaryColor = Color.fromARGB(255, 1, 25, 46);
  static const Color _primaryDarkColor =
      Color.fromARGB(255, 1, 25, 46); //FF33C072//62BD79
  // static const Color _accentColor = Color(0xFF2D8CBB);
  static const Color _hintColor = Color(0xffaaaaaa);
  static const Color _unselectedWidgetColor = Color(0xffcccccc);
  static const Color _backgroundColor = _blackColor;
  static const Color _scaffoldBackgroundColor = _blackColor;
  // static const Color _textColor = Color(0xFF283350);
  static const Color _textColor = Colors.white; //Color(0xffcccccc);
  //_whiteColor; //Color(0xFF283350);
  static const Color _cardColor = _blackColor; //_whiteColor;

  // Color(0xFF283350); //
  static const Color _bodySmallColor = Color(0xFFF7F8FC);

  static const TextTheme _textTheme = TextTheme(
    bodyLarge: TextStyle(
      color: _textColor,
    ),
    bodyMedium: TextStyle(
      color: _textColor,
    ),
    labelLarge: TextStyle(
      color: _textColor,
    ),
    bodySmall: TextStyle(
      color: _bodySmallColor,
    ),
    titleMedium: TextStyle(
      fontFamily: "NeueHaasDisplay",
      color: _textColor,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ), // <-- that's the one
    titleSmall: TextStyle(
      fontSize: 15,
      color: Colors.white, //Color(0xFFAAADC3),
      fontWeight: FontWeight.w500,
      fontFamily: "NeueHaasDisplay",
      //  color: _whiteColor,
    ),
    displayLarge: TextStyle(color: _textColor),
    displayMedium: TextStyle(color: _textColor),
    displaySmall: TextStyle(color: _textColor),
    headlineMedium: TextStyle(color: _textColor),
    headlineSmall: TextStyle(
      color: _textColor,
      fontFamily: "Aeonik",
      fontWeight: FontWeight.w500,
      fontSize: 25,
    ),
    titleLarge: TextStyle(
      fontFamily: "Aeonik",
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: _textColor,
    ),
    labelSmall: TextStyle(color: _textColor),
    labelMedium: TextStyle(color: _textColor),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    labelStyle: _textTheme.titleMedium?.copyWith(
      color: _textColor,
      fontWeight: FontWeight.w500,
      //  color: _whiteColor,
    ),
    hintStyle: _textTheme.titleMedium?.copyWith(
      color: _textColor.withValues(alpha: 0.5607843137254902),
      fontWeight: FontWeight.w500,
    ),
    errorStyle: _textTheme.titleMedium?.copyWith(
      color: Colors.redAccent, //.withOpacity(0.5607843137254902),
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: _primaryColor..withValues(alpha:0.5), width: 1),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFF8F8FC), width: 1),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        // color:
        //     Color(0xffFFFFFF), //.withAlpha(),
        // .withAlpha(5),
        // width: 2,
        color: Colors.red,
        width: 0.2,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(0.5),
      ),
    ),
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    // color: _blackColor,
    elevation: 2,
    backgroundColor: _primaryColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
      systemNavigationBarColor: _primaryDarkColor, // navigation bar color
      statusBarColor: _primaryColor, // status bar color
      statusBarBrightness: Brightness.dark, //status bar brightness
      statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
      systemNavigationBarDividerColor:
          Colors.greenAccent, //Navigation bar divider color
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
    ),
    centerTitle: true,

    iconTheme: const IconThemeData(color: _whiteColor), //_textColor
    actionsIconTheme: const IconThemeData(color: _whiteColor), //_textColor
    titleTextStyle: _textTheme.titleMedium?.copyWith(
      color: _textColor,
    ),
    toolbarTextStyle: _textTheme.titleMedium?.copyWith(
      color: _textColor,
    ),
  );

  static final ButtonThemeData _buttonTheme = ButtonThemeData(
    height: 48,
    padding: const EdgeInsets.only(left: 24, right: 24),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
    splashColor: Colors.transparent,
  );

  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
    primaryColorDark: _primaryDarkColor,
    hintColor: _hintColor,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    unselectedWidgetColor: _unselectedWidgetColor,
    // accentColor: _primaryColor,
    fontFamily: "NeueHaasDisplay",
    inputDecorationTheme: _inputDecorationTheme,
    cardColor: _cardColor,
    iconTheme: const IconThemeData(color: _whiteColor), //_textColor
    // colorScheme: ,
    // textTheme: _textTheme.apply(
    //   bodyColor: _textColor,
    //   displayColor: _textColor,
    // ),
    textTheme: _textTheme,
    tabBarTheme: TabBarTheme(
      labelColor: _whiteColor,
      labelStyle: const TextStyle(color: _whiteColor), // color for text

      unselectedLabelColor: _whiteColor.withValues(alpha:0.6),
      unselectedLabelStyle:
          TextStyle(color: _whiteColor.withValues(alpha:0.6)), // color for text

      indicator: const UnderlineTabIndicator(
        // color for indicator (underline)
        borderSide: BorderSide(color: _primaryColor),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: _primarySwatch).copyWith(
      surface: _backgroundColor,
      onSurface: const Color(0xFF2e2e2e),
      primary: _primaryColor,
      onPrimary: const Color(0xFFeeeeee),
      brightness: Brightness.dark,
    ),
  );
}
