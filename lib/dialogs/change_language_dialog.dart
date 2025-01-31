import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:enpal_assignment/data/enums/app_language_enum.dart';
import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeLanguageDialog extends HookWidget {
  final Function(String localeCode)? onLocaleChange;
  const ChangeLanguageDialog({super.key, this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      // alignment: WrapAlignment.center,
      // direction: Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<String>(
          title: Text(BaseL10S.german.tr, style: Get.textTheme.titleMedium),
          groupValue: Get.locale?.languageCode,
          value: AppLanguageEnum.german.langCode,
          onChanged: (value) {
            Get.updateLocale(Locale(AppLanguageEnum.german.langCode));
            onLocaleChange?.call(AppLanguageEnum.german.langCode);
            Get.back(closeOverlays: true);
          },
        ),
        RadioListTile<String>(
          title: Text(BaseL10S.english.tr, style: Get.textTheme.titleMedium)
              .objectTopLeft(),
          groupValue: Get.locale?.languageCode,
          value: AppLanguageEnum.english.langCode,
          onChanged: (value) {
            Get.updateLocale(Locale(AppLanguageEnum.english.langCode));
            onLocaleChange?.call(AppLanguageEnum.english.langCode);
            Get.back(closeOverlays: true);
          },
        ),
        RadioListTile<String>(
          title: Text(BaseL10S.arabic.tr, style: Get.textTheme.titleMedium),
          groupValue: Get.locale?.languageCode,
          value: AppLanguageEnum.arabic.langCode,
          onChanged: (value) {
            Get.updateLocale(Locale(AppLanguageEnum.arabic.langCode));
            onLocaleChange?.call(AppLanguageEnum.arabic.langCode);
            Get.back(closeOverlays: true);
          },
        ),
      ],
    );//.card.make();
  }
}
