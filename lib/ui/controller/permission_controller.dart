import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PermissionController extends GetxController {

 static PermissionController get to => Get.find();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}