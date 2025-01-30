import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class InternalServerErrorLayout extends HookWidget {
  const InternalServerErrorLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: Text(
          BaseL10S.unexpectedErrorHappened.tr,
          style: Get.textTheme.labelMedium,
        ),
      ),
    );
  }
}
