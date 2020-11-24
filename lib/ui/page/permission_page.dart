import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/entity/menu_entity.dart';
import 'package:manager/ui/controller/permission_controller.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/app_widget.dart';
import 'package:manager/utils/app_ext.dart';
import 'package:manager/utils/app_validator.dart';

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
    var menuEntity = MenuEntity();

    var dialog = Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: 400,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            AppText.textField(
                label: '父级',
                onSaved: (value) {
                  menuEntity.parent = value;
                }),
            AppWidget.empty(height: 16),
            AppText.textField(
                label: "名称",
                autoValidateMode: AutovalidateMode.always,
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
                autoValidateMode: AutovalidateMode.always,
                validator: (value) {
                  return emptyValidator(value, "类型不可为空");
                },
                onChanged: (value) {
                  menuEntity.type = value as int;
                }),
            AppWidget.empty(height: 16),
            AppText.textField(
                label: '权重',
                autoValidateMode: AutovalidateMode.always,
                validator: (value) {
                  return emptyValidator(value, "权重不可为空");
                },
                inputType: TextInputType.number,
                onChanged: (value) {
                  menuEntity.weight = value as int;
                }),
            AppWidget.empty(height: 16),
            AppText.textField(
                label: '路径',
                autoValidateMode: AutovalidateMode.always,
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
        controller.addMenu(menuEntity);
        Get.back();
      }),
    );
  }
}
