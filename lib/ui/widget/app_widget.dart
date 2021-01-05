import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/widget/app_text.dart';

class AppWidget {
  AppWidget._();

  static Widget empty({double width: 0, double height: 0}) {
    return Container(
      width: width,
      height: height,
    );
  }

  static Widget line({double width, double height: 1, Color color}) {
    final Color effectiveColor = color ?? (DividerTheme.of(Get.context).color ?? Theme.of(Get.context).dividerColor);
    return Container(
      width: width,
      height: height,
      color: effectiveColor,
    );
  }

  static Widget card({double width: 0, double height: 0}) {
    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.subtitle('访问量').paddingSymmetric(horizontal: 16, vertical: 16),
            AppWidget.line(height: 1),
            AppText.display1("25,848",maxLines: 1).paddingAll(16),
            AppText.body("日同比 12.5% 周同比 5% ",maxLines: 1).paddingOnly(left: 16, right: 16, bottom: 16),
            AppWidget.line(height: 1),
            AppText.subtitle('总访问量').paddingSymmetric(horizontal: 16, vertical: 8),
          ],
        ),
      ),
    );
  }
}
