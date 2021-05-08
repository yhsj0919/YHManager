import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/route/routes.dart';
import 'package:manager/ui/controller/root_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/app_widget.dart';
import 'package:manager/ui/widget/blur_app_bar.dart';
import 'package:manager/ui/widget/blur_widget.dart';

class RootPage extends StatelessWidget {
  final RootController controller = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlurAppBar(
        tooltip: "菜单",
        excludeHeaderSemantics: false,
        title: AppText.subtitle("管理系统"),
      ),
      drawer: _drawer(context),
      drawerScrimColor: Colors.transparent,
      body: Navigator(
        key: Get.nestedKey(Routes.Key),
        initialRoute: Routes.Home,
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
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerHeader(child: Container()),
            ]..addAll(
                controller.menus.map((item) {
                  return AppWidget.expansionItemWidget(
                    title: [
                      Icon(Icons.dashboard),
                      AppWidget.spanHorizontal10(),
                      AppText.body('${item.value.name}'),
                    ],
                    children: item.value.child
                        ?.map((e) => ListTile(
                              // contentPadding: EdgeInsets.only(left: 20, right: 16),
                              onTap: () {
                                if (controller.route != e.path) {
                                  controller.route = e.path;
                                  Get.offAndToNamed(controller.route, id: Routes.Key);
                                }
                                Get.back();
                              },
                              // leading: Icon(Icons.subdirectory_arrow_right),
                              title: Text('${e?.name}'),
                            ))
                        ?.toList(),
                  );
                }).toList(),
              ),
          ),
        ),
      ),
    );
  }
}
