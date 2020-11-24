import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';

class PermissionController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final menus = [].obs;

  Future addMenu(MenuEntity menu) {

    if (formKey.currentState.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      formKey.currentState.save();

      menus.add(menu.obs);
      return Future.value("");
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
        menu.update((val) {
          val.expanded = !isExpanded;
        });
      } else {
        menu.update((val) {
          val.expanded = false;
        });
      }
    });
  }
}
