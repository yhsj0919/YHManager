import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/utils/ext.dart';

class ServerErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurWidget(
        height: context.height,
        width: context.width,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center.isMobile(def: MainAxisAlignment.start),
          children: [
            Flexible(child: Image.asset("images/ic_500.png", width: 400, height: 400)).showBy(!context.isPhone),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: context.isPhone ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Flexible(child: Image.asset("images/ic_500.png", width: 400, height: 400)).showBy(context.isPhone),
                AppText.display3('500', fontWeight: FontWeight.bold, color: Color(0xff515a6e)),
                AppText.title('抱歉，服务器出错了', color: Color(0xff808695)).paddingSymmetric(vertical: 10),
                // AppButton.button("首页", onTap: () {
                //   Get.offAndToNamed(Routes.Home, id: Routes.Key);
                // }).paddingSymmetric(vertical: 10),
              ],
            ).paddingOnly(left: context.isPhone ? 0 : 80)),
          ],
        ).paddingAll(50),
      ),
    );
  }
}
