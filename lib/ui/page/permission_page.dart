import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';
import 'package:manager/ui/controller/permission_controller.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/app_widget.dart';
import 'package:manager/ui/widget/argon_buttons_flutter.dart';
import 'package:manager/utils/app_ext.dart';
import 'package:manager/utils/app_validator.dart';

class PermissionPage extends GetView<PermissionController> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 600.0.isMobile(def: context.width),
        child: Scaffold(
          body: SingleChildScrollView(
            child: controller.obx(
              (menus) => ExpansionPanelList(
                expansionCallback: controller.openMenu,
                children: menus.map((item) => _buildExpansionPanel(item)).toList(),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _addDialog();
            },
          ),
        ),
      ),
      Container(
        width: 1,
        height: context.height,
        color: Colors.black12,
      ).isMobile(def: Container())
    ]);
  }

  //可展开列表
  ExpansionPanel _buildExpansionPanel(MenuEntity menu) {
    return ExpansionPanel(
      isExpanded: menu.expanded ?? false,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return _buildTitle(context, isExpanded, menu);
      },
      body: _buildChildren(menu.child),
    );
  }

  //父级标题
  Widget _buildTitle(BuildContext context, bool isExpanded, MenuEntity menu) {
    return ListTile(
      leading: Icon(Icons.api, color: isExpanded ? Theme.of(context).accentColor : Colors.grey),
      title: Row(
        children: [
          Expanded(flex: 1, child: AppText.title('${menu?.name}')),
        ],
      ),
      subtitle: AppText.subtitle('${menu?.path}'),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.add),
              onPressed: () {
                _addDialog(parent: menu);
              },
            ),
          ],
        ),
      ),
    );
  }

  //子菜单
  Widget _buildChildren(List<MenuEntity> menus) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20),
      shrinkWrap: true,
      itemCount: menus.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _buildChildTitle(menus[index]);
      },
    );
  }

  //子菜单标题
  Widget _buildChildTitle(MenuEntity menu) {
    return ListTile(
      leading: Icon(Icons.subdirectory_arrow_right),
      title: AppText.title('${menu?.name}'),
      subtitle: AppText.subtitle('${menu?.path}'),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTable(MenuEntity menu) {
    return Row(children: [
      AppText.title(menu.name).expanded(),
      AppText.title('${menu.type}').expanded(),
      AppText.title('${menu.weight}').expanded(),
      AppText.title('${menu.path}').expanded(),
    ]);
  }

  void _addDialog({MenuEntity parent, bool watch}) {
    var menuEntity = MenuEntity();
    menuEntity.parent = parent?.id;
    var dialog = Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: 400,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            AppText.textField(label: '父级', text: parent?.name ?? '', enable: false).showBy(parent != null),
            AppWidget.empty(height: 16).showBy(parent != null),
            AppText.textField(
                label: "名称",
                validator: (value) {
                  return emptyValidator(value, "名称不可为空");
                },
                onChanged: (value) {
                  menuEntity.name = value;
                }),
            AppWidget.empty(height: 16),
            AppText.textField(label: '图标', onChanged: (value) {}),
            AppWidget.empty(height: 16),
            AppText.textField(
                label: '类型',
                inputType: TextInputType.number,
                validator: (value) {
                  return emptyValidator(value, "类型不可为空");
                },
                onChanged: (value) {
                  menuEntity.type = int.tryParse(value) ?? 0;
                }),
            AppWidget.empty(height: 16),
            AppText.textField(
                label: '权重',
                validator: (value) {
                  return emptyValidator(value, "权重不可为空");
                },
                inputType: TextInputType.number,
                onChanged: (value) {
                  menuEntity.weight = int.tryParse(value) ?? 0;
                }),
            AppWidget.empty(height: 16),
            AppText.textField(
                label: '路径',
                validator: (value) {
                  return emptyValidator(value, "路径不可为空");
                },
                onChanged: (value) {
                  menuEntity.path = value;
                }),
            AppWidget.empty(height: 16),
          ],
        ),
      ),
    );

    Get.defaultDialog(
      title: '添加',
      barrierDismissible: false,
      content: dialog,
      radius: 10,
      cancel: AppButton.textButton("取消", Get.back, width: 80, height: 40),
      confirm: AppButton.button2("确定", width: 80, height: 40, onTap: (startLoading, stopLoading, btnState) {
        if (btnState == ButtonState.None) {
          startLoading();
          controller.addMenu(menuEntity).catchError((error) {
            stopLoading();
          }).whenComplete(() => stopLoading());
        }
      }),
    );
  }
}
