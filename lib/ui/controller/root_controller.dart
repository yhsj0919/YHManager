import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';

class RootController extends GetxController {
  RxList<Rx<MenuEntity>> menus = RxList<Rx<MenuEntity>>();
  var json = [
    {
      "name": "首页",
      "child": [
        {
          "name": "首页",
          "path": "/home",
        }
      ],
    },
    {
      "name": "销售",
      "child": [
        {
          "name": "称重",
          "path": "/weigh",
        },
        {
          "name": "料品管理",
          "path": "/goods",
        },
        {
          "name": "单据管理",
          "path": "/order",
        },
        {
          "name": "客户管理",
          "path": "/customer",
        },
        {
          "name": "交账管理管理",
          "path": "/todayOrder",
        }
      ],
    },
    {
      "name": "设置",
      "child": [
        {
          "name": "用户管理",
          "path": "/userManager",
        },
        {
          "name": "设备管理",
          "path": "/drive",
        },
        {
          "name": "打印设置",
          "path": "/printSetting",
        },
        {
          "name": "系统设置",
          "path": "/systemSeting",
        },
      ],
    }
  ];

  String route;

  @override
  void onInit() {
    super.onInit();
    getPermission();
  }

  Future getPermission() {
    List<MenuEntity> data = JsonMapper.deserialize(JsonEncoder().convert(json));
    menus.clear();
    menus.addAll(data.map((e) => e.obs).toList());

    // return AppApi.getPermission().then((value) {
    //   List<MenuEntity> data = value.data;
    //   menus.clear();
    //   menus.addAll(data.map((e) => e.obs).toList());
    // }).catchError((error) {});
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
