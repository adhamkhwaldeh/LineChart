import 'package:enpal_assignment/get_localization/base_l10s.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class NoDataLayout extends HookWidget {
  const NoDataLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: Text(
          BaseL10S.noMoreData.tr,
          style: Get.textTheme.labelMedium,
        ),
      ),
    );
  }
}
