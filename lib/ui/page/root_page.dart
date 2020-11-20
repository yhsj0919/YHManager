import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/route/routes.dart';
import 'package:manager/ui/controller/root_controller.dart';
import 'package:manager/ui/widget/app_text.dart';

class RootPage extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.title("标题"),
      ),
      drawer: _drawer(),
      body: Navigator(
        key: Get.nestedKey(Routes.Key),
        initialRoute: Routes.Home,
        onGenerateRoute: (setting) {
          return Routes.getRoute(setting);
        },
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        children: [
          DrawerHeader(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: Container(
              color: Theme.of(Get.context).accentColor,
            ),
          ),
          Obx(() => ExpansionPanelList(
                expansionCallback: controller.openMenu,
                children: controller.menus
                    .map(
                      (item) => ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: item.value.expanded,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            leading: Icon(
                              item.value.icon,
                              color: isExpanded ? Theme.of(context).accentColor : Colors.grey,
                            ),
                            title: AppText.subtitle('${item.value.name}'),
                          );
                        },
                        body: Column(
                          children: item.value.child
                              ?.map(
                                (e) => ListTile(
                                    onTap: () {
                                      Get.back();
                                    },
                                    leading: Icon(e.icon),
                                    title: AppText.subtitle('${e.name}')),
                              )
                              ?.toList(),
                        ),
                      ),
                    )
                    .toList(),
              )),
        ],
      )),
    );
  }
}
