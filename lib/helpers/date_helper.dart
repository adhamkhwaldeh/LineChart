import 'package:intl/intl.dart';

class DateHelper {
  static String? getDateOnly(DateTime? date) {
    if (date == null) return null;
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(date);
    } catch (ex) {
      return null;
    }
  }

  // static String? getUIDate(String? date) {
  //   if (date == null) return null;
  //   try {
  //     final DateTime now = DateTime.now();
  //     final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
  //     return formatter.format(now);
  //   } catch (ex) {
  //     return null;
  //   }
  // }

  static Duration? getDifference(String? endDate, String? startDate) {
    if (endDate == null || startDate == null) {
      return null;
    }
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd\'T\'hh:mm:ss');
      return getDateDifference(
          formatter.parse(endDate), formatter.parse(startDate));
    } catch (ex) {
      return null;
    }
  }

  static Duration? getDateDifference(DateTime? endDate, DateTime? startDate) {
    return startDate != null ? endDate?.difference(startDate) : null;
  }
}
