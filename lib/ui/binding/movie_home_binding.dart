import 'package:get/get.dart';
import 'package:manager/ui/controller/movie_home_controller.dart';

class MovieHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieHomeController());
  }
}
