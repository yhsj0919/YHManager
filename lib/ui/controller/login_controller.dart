import 'package:get/get.dart';
import 'package:manager/api/BingApi.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final image_bg = 'images/huangshan.jpg'.obs;
  final http_bg = ''.obs;

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
}
