import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/api/app_api.dart';
import 'package:manager/api/bing_api.dart';
import 'package:manager/route/routes.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final image_bg = 'images/huangshan.jpg'.obs;
  final http_bg = ''.obs;

  var userName = ''.obs;
  var passWord = ''.obs;
  var isObscure = RxBool(true);

  var tip = ''.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // getWallpaper();
  }

  void getWallpaper() {
    BingApi.getWallpaper().then((value) {
      http_bg.value = "https://cn.bing.com/" + value['images'][0]['url'];
    }).catchError((e) {});
  }

  Future login() {
    tip.value = "";
    if (formKey.currentState.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      formKey.currentState.save();

      return AppApi.login({"userName": userName.value, "passWord": passWord.value}).then((value) {
        Get.offAndToNamed(Routes.Root);
      }).catchError((e) {
        tip.value = e.toString();
      });
    } else {
      return Future.value("");
    }
  }
}
