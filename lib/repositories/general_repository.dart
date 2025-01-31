import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GeneralRepository {
  final SharedPreferences sharedPreferences;

  static const String _appNotificationTag = "appNotificationTag";

  static const String _appThemeTag = "appThemeTag";

  static const String _appLocalizationTag = "appLocalizationTag";

  GeneralRepository(this.sharedPreferences);

  bool? isDarkTheme() => sharedPreferences.getBool(_appThemeTag);

  void setDarkTheme(bool isDarkTheme) =>
      sharedPreferences.setBool(_appThemeTag, isDarkTheme);

  bool isNotification() =>
      sharedPreferences.getBool(_appNotificationTag) ?? true;

  void setNotification(bool isDarkTheme) =>
      sharedPreferences.setBool(_appNotificationTag, isDarkTheme);

  String? getLocaleCode() => sharedPreferences.getString(_appLocalizationTag);

  void settLocaleCode(String localeCode) =>
      sharedPreferences.setString(_appLocalizationTag, localeCode);
}
