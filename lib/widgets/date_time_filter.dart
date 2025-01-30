import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:enpal_assignment/helpers/dimensions_helper.dart';
import 'package:enpal_assignment/helpers/date_picker_helper.dart';
// import 'package:property_man/list_item_builder/property_feature_criterion/date_text_formatter.dart';
import 'package:velocity_x/velocity_x.dart';

class DateTimeFilter extends HookWidget {
  final String? dateTime;
  final Function(DateTime?) onChanged;
  const DateTimeFilter({
    required this.dateTime,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.calendar_today_rounded,
            color: Get.theme.iconTheme.color,
            size: DimensionsHelper.iconSize,
          ),
          Text(
            dateTime ?? "",
            style: Get.textTheme.labelLarge,
          ).marginSymmetric(horizontal: DimensionsHelper.marginSM).expand(),
        ],
      ),

      onTap: () {
        DatePickerHelper.selectDate(
          context,
          DateTime.now(),
          (DateTime dateTime) {
            onChanged(dateTime);
            return () {
              onChanged(dateTime);
            };
          },
        );
      },
    ).marginAll(DimensionsHelper.marginMD);
  }
}
