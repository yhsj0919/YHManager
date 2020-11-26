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
        initialRoute: Routes.Permission,
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
                        isExpanded: item.value.expanded ?? false,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            leading: Icon(
                              Icons.dashboard,
                              color: isExpanded ? Theme.of(context).accentColor : Colors.grey,
                            ),
                            title: AppText.subtitle('${item.value.name}'),
                          );
                        },
                        body: ListView.builder(
                          padding: EdgeInsets.only(left: 20),
                          shrinkWrap: true,
                          itemCount: item.value.child?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: () {
                                Get.offAndToNamed('${item.value?.child[index]?.path}', id: Routes.Key);
                                Get.back();
                              },
                              leading: Icon(Icons.subdirectory_arrow_right),
                              title: Text('${item.value?.child[index]?.name}'),
                            );
                          },
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
