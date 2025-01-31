import 'package:enpal_assignment/components/home_page.dart';
import 'package:enpal_assignment/di/di.dart';
import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:enpal_assignment/get_localization/messages_translations.dart';
import 'package:enpal_assignment/repositories/general_repository.dart';
import 'package:enpal_assignment/themes/dark_theme.dart';
import 'package:enpal_assignment/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EnpalApp extends StatelessWidget {
  const EnpalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var generalRepository = getIt<GeneralRepository>();
    final isDarkMode = (generalRepository.isDarkTheme() == true);
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        translations: MessagesTranslations(), // your translations
        // supportedLocales: const [Locale('en'), Locale('ar'), Locale('de')],

        // .map(
        //     (language) => Locale(language.languageCode, language.countryCode))
        // .toList(),
        // locale: Locale(generalRepository.getLocaleCode() ?? "en"),
        locale: Get.deviceLocale,
        // textDirection: TextDirection.rtl,

        // translations will be displayed in that locale
        fallbackLocale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        themeMode: (generalRepository.isDarkTheme() == null)
            ? ThemeMode.system
            : (isDarkMode ? ThemeMode.dark : ThemeMode.light),
        theme: LightTheme.themeData,
        darkTheme: DarkTheme.themeData,

        // themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        // theme: ThemeData.light(),
        // darkTheme: ThemeData.dark(),

        useInheritedMediaQuery: true,
        navigatorObservers: [
          GetObserver(),
          NavigatorObserver(),
          RouteObserver(),
        ],
        title: BaseL10S.enpalApp.tr,

        // builder: DevicePreview.appBuilder,
        home: const HomePage(),
      ),
    );
  }
}
