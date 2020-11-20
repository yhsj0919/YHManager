import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/login_controller.dart';
import 'package:manager/ui/widget/blur_rect_widget.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/argon_buttons_flutter.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            alignment: Alignment.center,
            children: [
              Image.network(controller.http_bg.value, width: context.width, height: context.height, fit: BoxFit.cover, errorBuilder: (a, _, s) => getImage(controller.image_bg.value, context)),
              BlurRectWidget(
                margin: 40,
                width: 400,
                padding: 30,
                height: 400,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppText.title('appName'.tr),
                      Expanded(flex: 2, child: Container()),
                      _buildUserName(),
                      Expanded(flex: 2, child: Container()),
                      _buildPassword(context),
                      Expanded(flex: 1, child: Container()),
                      AppText.tip(controller.tip.value, width: 300),
                      Expanded(flex: 1, child: Container()),
                      AppButton.button2(
                        'login'.tr,
                        width: 300,
                        onTap: (startLoading, stopLoading, btnState) {
                          if (btnState == ButtonState.None) {
                            startLoading();
                            controller.login().whenComplete(() => stopLoading());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildUserName() {
    return Container(
      width: 300,
      child: TextFormField(
        initialValue: "18612345678",
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          labelText: 'userName'.tr,
        ),
        validator: (value) {
          var emailReg = RegExp(r"^[1][3,4,5,7,8][0-9]{9}$");
          if (!emailReg.hasMatch(value)) {
            return 'userNameTip'.tr;
          } else {
            return null;
          }
        },
        onSaved: (String value) => controller.userName.value = value,
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        initialValue: 'admin#@.',
        keyboardType: TextInputType.text,
        onSaved: (String value) => controller.passWord.value = value,
        obscureText: controller.isObscure.value,
        validator: (String value) {
          if (value.isEmpty) {
            return 'passWordTip'.tr;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'password'.tr,
            suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye, color: controller.isObscure.value ? Colors.grey : Theme.of(context).iconTheme.color),
                onPressed: () {
                  controller.isObscure.value = !controller.isObscure.value;
                })),
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
