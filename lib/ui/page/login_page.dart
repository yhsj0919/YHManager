import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/login_controller.dart';
import 'package:manager/ui/widget/BlurRectWidget.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_shape.dart';
import 'package:manager/ui/widget/app_text.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() {
            return Image.network(controller.http_bg.value, width: context.width, height: context.height, fit: BoxFit.cover, errorBuilder: (a, _, s) => getImage(controller.image_bg.value, context));
          }),
          BlurRectWidget(
            margin: 40,
            width: 400,
            padding: 30,
            height: 400,
            child: Column(
              children: [
                AppText.title('后台管理系统'),
                Expanded(flex: 1, child: Container(),),
                AppButton.button('登录', () {}, width: 300),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getImage(String url, BuildContext context) {
    return Image.asset(
      controller.image_bg.value,
      width: context.width,
      height: context.height,
      fit: BoxFit.cover,
    );
  }
}
