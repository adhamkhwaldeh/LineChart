import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerHelper {
  static selectDate(BuildContext context, DateTime selectedDate,
      Function Function(DateTime dateTime) onDatePicked) async {
    final ThemeData theme = Get.theme;
    // assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildMaterialDatePicker(context, selectedDate, onDatePicked);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _buildCupertinoDatePicker(context, selectedDate, onDatePicked);
    }
  }

  /// This builds material date picker in Android
  static _buildMaterialDatePicker(BuildContext context, DateTime selectedDate,
      Function Function(DateTime dateTime) onDatePicked) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child ?? Container(),
        );
      },
    );
    if (picked != null && picked != selectedDate) onDatePicked.call(picked);
  }

  /// This builds cupertion date picker in iOS
  static _buildCupertinoDatePicker(BuildContext context, DateTime selectedDate,
      Function Function(DateTime dateTime) onDatePicked) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {
              if (picked != selectedDate) onDatePicked.call(picked);
            },
            initialDateTime: selectedDate,
            minimumYear: 1970,
            maximumYear: 2050,
          ),
        );
      },
    );
  }

 
}
