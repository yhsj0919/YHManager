import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/route/routes.dart';
import 'package:manager/ui/controller/root_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/blur_app_bar.dart';
import 'package:manager/ui/widget/blur_widget.dart';

class RootPage extends StatelessWidget {
  final RootController controller = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlurAppBar(
        title: AppText.title("标题"),
      ),
      drawer: _drawer(context),
      drawerScrimColor: Colors.transparent,
      body: Navigator(
        key: Get.nestedKey(Routes.Key),
        initialRoute: Routes.Permission,
        reportsRouteUpdateToEngine: true,
        onGenerateRoute: (setting) {
          return Routes.getRoute(setting);
        },
      ),
    );
  }

  Widget _drawer(BuildContext context) {
    return BlurWidget(
      width: 304.0,
      height: context.height,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => ExpansionPanelList(
                expansionCallback: controller.openMenu,
                children: controller.menus
                    .map(
                      (item) => ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: item.value.expanded ?? false,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            leading: Icon(Icons.dashboard, color: isExpanded ? Theme.of(context).accentColor : Colors.grey),
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
                                var route = item.value?.child[index]?.path;
                                if (controller.route != route) {
                                  controller.route = route;
                                  Get.offAndToNamed(controller.route, id: Routes.Key);
                                }
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
