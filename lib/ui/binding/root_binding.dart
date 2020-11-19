import 'package:get/get.dart';
import 'package:manager/ui/controller/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}