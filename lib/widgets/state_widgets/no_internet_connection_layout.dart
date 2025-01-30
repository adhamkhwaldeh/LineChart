import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:enpal_assignment/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class NotInternetConnectionLayout extends HookWidget {
  final VoidCallback reTry;

  const NotInternetConnectionLayout({super.key, required this.reTry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          BaseL10S.internetIssue.tr,
          style: Get.textTheme.titleMedium,
        ).marginAll(DimensionsHelper.marginMD),
        OutlinedButton(
          onPressed: reTry,
          child: Text(
            BaseL10S.reTry.tr,
            style: Get.textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
