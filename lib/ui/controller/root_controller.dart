import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/api/app_api.dart';
import 'package:manager/entity/menu_entity.dart';

class RootController extends GetxController {
  RxList<Rx<MenuEntity>> menus = RxList<Rx<MenuEntity>>();

  @override
  void onInit() {
    super.onInit();
    getPermission();
  }

  Future getPermission() {
    return AppApi.getPermission().then((value) {
      List<MenuEntity> data = value.data;

      menus.clear();
      menus.addAll(data.map((e) => e.obs).toList());
    }).catchError((error) {});
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
