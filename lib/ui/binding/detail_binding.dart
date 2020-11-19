import 'package:get/get.dart';
import 'package:manager/ui/controller/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
