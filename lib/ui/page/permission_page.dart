import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';
import 'package:manager/ui/controller/permission_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/app_widget.dart';
import 'package:manager/utils/app_ext.dart';

class PermissionPage extends GetView<PermissionController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 400.0.isMobile(def: context.width),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Obx(
                () => ExpansionPanelList(
                  expansionCallback: controller.openMenu,
                  children: controller.menus
                      .map(
                        (item) => ExpansionPanel(
                          isExpanded: item.value.expanded,
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return ListTile(
                              leading: Icon(
                                item.value.icon,
                                color: isExpanded ? Theme.of(context).accentColor : Colors.grey,
                              ),
                              title: AppText.subtitle('${item.value.name}'),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {},
                              ),
                            );
                          },
                          body: Container(),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _addDialog();
                controller.addMenu(MenuEntity(id: '1', name: "测试", icon: Icons.menu, expanded: false));
              },
            ),
          ),
        ),
        Container(
          width: 1,
          height: context.height,
          color: Colors.black12,
        ).isMobile(def: Container())
      ],
    );
  }

  void _addDialog() {
    var dialog = Container(
      padding: EdgeInsets.all(16),
      width: 400,
      child: Form(
        child: Column(
          children: [
            AppText.textField(label: '父级'),
            AppWidget.empty(height: 16),
            AppText.textField(label: "名称"),
            AppWidget.empty(height: 16),
            AppText.textField(label: '图标'),
            AppWidget.empty(height: 16),
            AppText.textField(label: '类型'),
            AppWidget.empty(height: 16),
            AppText.textField(label: '权重'),
            AppWidget.empty(height: 16),
            AppText.textField(label: '路径'),
            AppWidget.empty(height: 16),
          ],
        ),
      ),
    );

    Get.defaultDialog(title: '添加', content: dialog, radius: 10);
  }
}
