enum AppLanguageEnum {
  arabic,
  english,
  german,
  defaultLanguage,
}

extension TAppThemeExtension on AppLanguageEnum {
  String get name {
    switch (this) {
      case AppLanguageEnum.arabic:
        return 'ARABIC';
      case AppLanguageEnum.english:
        return 'ENGLISH';
      case AppLanguageEnum.german:
        return 'GERMAN';
      case AppLanguageEnum.defaultLanguage:
        return 'DEFAULT';
    }
  }

  String get langCode {
    switch (this) {
      case AppLanguageEnum.arabic:
        return 'ar';
      case AppLanguageEnum.english:
        return 'en';
      case AppLanguageEnum.german:
        return 'de';
      case AppLanguageEnum.defaultLanguage:
        return 'en';
    }
  }
}
