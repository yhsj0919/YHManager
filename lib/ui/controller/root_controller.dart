import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';

class RootController extends GetxController {
  final menus = [
    MenuEntity(icon: Icons.computer, name: "系统设置", child: [MenuEntity(icon: Icons.build, name: '设备管理'), MenuEntity(icon: Icons.print, name: '打印设置')]).obs,
    MenuEntity(icon: Icons.settings, name: '其他设置', child: []).obs
  ].obs;
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
