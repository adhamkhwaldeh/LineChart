import 'package:enpal_assignment/get_localization/base_arabic.dart';
import 'package:enpal_assignment/get_localization/base_english.dart';
import 'package:enpal_assignment/get_localization/base_german.dart';
import 'package:get/get.dart';

class MessagesTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': BaseEnglish.baseEnglish,
        'ar': BaseArabic.baseArabic,
        'de': BaseGerman.baseGerman,
      };
}
