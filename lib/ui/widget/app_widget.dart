import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/blur_widget.dart';

import 'app_button.dart';
import 'expansion_widget.dart';

class AppWidget {
  AppWidget._();

  static Widget empty({double width: 0, double height: 0}) {
    return Container(
      width: width,
      height: height,
    );
  }

  static Widget line({double width, double height: 1, Color color, double marginVertical: 0, double marginHorizontal: 0}) {
    final Color effectiveColor = color ?? (DividerTheme.of(Get.context).color ?? Theme.of(Get.context).dividerColor);
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: marginVertical, horizontal: marginHorizontal),
      color: effectiveColor,
    );
  }

  //首页信息卡片
  static Widget infoCard({double width: 0, double height: 0}) {
    return BlurWidget(
      width: width,
      height: height,
      elevation: 4,
      radius: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.subtitle('访问量').paddingSymmetric(horizontal: 16, vertical: 16),
          AppWidget.line(height: 1),
          AppText.headline("25,848", maxLines: 1).paddingAll(16),
          AppText.body("日同比 12.5% 周同比 5% ", maxLines: 1).paddingOnly(left: 16, right: 16, bottom: 16),
          AppWidget.line(height: 1),
          AppText.subtitle('总访问量').paddingSymmetric(horizontal: 16, vertical: 8),
        ],
      ),
    );
  }

  //首页按钮卡片
  static Widget buttonCard({double width: 0, double height: 0}) {
    return BlurWidget(
      width: width,
      height: height,
      elevation: 4,
      radius: 10,
      // shadowColor: Color(0x33009900),
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 40,
          ),
          AppText.subtitle('用户', maxLines: 1),
        ],
      ),
    );
  }

  static Widget menuBarWidget({List<Widget> title: const [], List<Widget> actions: const [], List<Widget> children: const []}) {
    return ExpansionWidget(
      expandedAlignment: Alignment.topLeft,
      minHeight: 50,
      title: Row(
        children: title ?? []
          ..add(Expanded(child: Container()))
          ..addAll(actions),
      ),
      children: children,
    ).paddingOnly(top: 16, left: 16, right: 16);
  }
}
