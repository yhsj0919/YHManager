import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manager/api/app_api.dart';
import 'package:manager/entity/menu_entity.dart';

class PermissionController extends GetxController with StateMixin<List<MenuEntity>> {
  final formKey = GlobalKey<FormState>();
  List<MenuEntity> menus = List<MenuEntity>();

  @override
  void onInit() {
    super.onInit();
    getPermission();
  }

  Future getPermission() {
    change(menus, status: RxStatus.loading());

    return AppApi.getPermission().then((value) {
      menus.clear();
      menus.addAll(value.data);

      change(menus, status: RxStatus.success());
    }).catchError((error) {});
  }

  Future addMenu(MenuEntity menu) {
    if (formKey.currentState.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      formKey.currentState.save();

      return AppApi.addPermission(param: menu.toJson()).then((value) {
        menus.clear();
        menus.addAll(value.data);
        change(menus, status: RxStatus.success());
        Get.back();
      });
    } else {
      return Future.value("");
    }
  }

  void addMenuChild(String parent, MenuEntity menu) {
    // menus.add(menu.obs);
  }

  void openMenu(index, isExpanded) {
    menus.forEach((menu) {
      if (menus.indexOf(menu) == index) {
        menu.expanded = !isExpanded;
      } else {
        menu.expanded = false;
      }
    });

    change(menus, status: RxStatus.success());
  }
}
