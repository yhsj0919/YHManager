import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';

class PermissionController extends GetxController {
  final menus = [].obs;

  void addMenu(MenuEntity menu) {
    menus.add(menu.obs);
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
