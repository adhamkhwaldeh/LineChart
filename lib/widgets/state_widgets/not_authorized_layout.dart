import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class NotAuthorizedLayout extends HookWidget {
  final VoidCallback requestAuthorization;

  const NotAuthorizedLayout({super.key, required this.requestAuthorization});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(BaseL10S.notAuthorized.tr),
        OutlinedButton(
          onPressed: requestAuthorization,
          child: Text(
            BaseL10S.request.tr,
            style: Get.textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
