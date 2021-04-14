import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:manager/entity/company_entity.dart';
import 'file:///D:/Server/YHManager/lib/ui/controller/company/company_controller.dart';
import 'package:manager/ui/widget/AppTextField.dart';
import 'package:manager/ui/widget/argon_buttons_flutter.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/ui/widget/widget.dart';
import 'package:manager/utils/app_ext.dart';
import 'package:manager/utils/app_validator.dart';

import 'company_detail_page.dart';

class CompanyManagerPage extends StatelessWidget {
  final CompanyController controller = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 400.0.isMobile(def: context.width),
        child: Scaffold(
          body: controller.obx(
            (datas) => ListView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(datas[index]);
              },
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
      ).isMobile(def: Container()),
      Expanded(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() => controller.companyDetail.value ?? Container()),
      )).isMobile(def: Container()),
    ]);
  }

  Widget _buildItem(CompanyEntity company) {
    return BlurWidget(
      color: Colors.white.withAlpha(200),
      elevation: 0,
      onTap: () {
        controller.companyDetail.value = CompanyDetailPage(company);
      },
      child: AppWidget.column(
        padding: 0,
        children: [
          Row(children: [
            AppText.subtitle(company.name).expanded(),
            AppText.body(DateTime.fromMillisecondsSinceEpoch(company.expirationTime).format('yyyy-MM-dd'),
                color: DateTime.now().millisecondsSinceEpoch <= company.expirationTime ? Colors.green : Colors.redAccent),
            _popMenu(),
          ]),
          AppWidget.spanVertical5(),
          AppText.body("${company.address ?? ''}").icon(FaIcon(FontAwesomeIcons.mapSigns, size: 15)),
        ],
      ).paddingOnly(left: 25, top: 10, bottom: 10, right: 4),
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: Color(0xffe5e5e5),
        ),
      ),
    );
  }

  Widget _popMenu() {
    var menu = {"编辑": Icons.edit, "删除": Icons.delete};
    return PopupMenuButton(
      padding: EdgeInsets.all(0),
      // elevation: 2,
      tooltip: '更多',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
      itemBuilder: (BuildContext context) {
        return menu.keys
            .map(
              (e) => PopupMenuItem(
                value: e,
                child: Wrap(
                  spacing: 10,
                  children: [Icon(menu[e]), AppText.body(e)],
                ),
              ),
            )
            .toList();
      },
      onSelected: (ww) {},
    );
  }

  void _addDialog() {
    var company = CompanyEntity();

    var dialog = Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            AppTextField(
                width: 300,
                label: "名称",
                validator: (value) {
                  return emptyValidator(value, "名称不可为空");
                },
                onSaved: (value) {
                  company.name = value;
                }),
            AppWidget.empty(height: 16),
            AppTextField(
              width: 300,
              label: '电话',
              validator: (value) {
                return phoneValidator(value, "请输入正确的手机号");
              },
              onSaved: (value) {
                company.phone = value;
              },
            ),
            AppWidget.empty(height: 16),
            AppTextField(
                width: 300,
                label: '到期时间',
                inputType: TextInputType.number,
                validator: (value) {
                  return emptyValidator(value, "到期时间不可为空");
                },
                onSaved: (value) {
                  company.expirationTime = int.tryParse(value) ?? 0;
                }),
            AppWidget.empty(height: 16),
            AppTextField(
                width: 300,
                label: '经度',
                validator: (value) {
                  return emptyValidator(value, "经度不可为空");
                },
                inputType: TextInputType.number,
                onChanged: (value) {
                  company.longitude = value;
                }),
            AppWidget.empty(height: 16),
            AppTextField(
                width: 300,
                label: '纬度',
                validator: (value) {
                  return emptyValidator(value, "纬度不可为空");
                },
                onChanged: (value) {
                  company.latitude = value;
                }),
            AppWidget.empty(height: 16),
            AppTextField(
                width: 300,
                label: '地址',
                validator: (value) {
                  return emptyValidator(value, "地址不可为空");
                },
                onChanged: (value) {
                  company.address = value;
                }),
            AppWidget.empty(height: 16),
            AppTextField(
                width: 300,
                label: '备注',
                validator: (value) {
                  return emptyValidator(value, "备注不可为空");
                },
                onChanged: (value) {
                  company.note = value;
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
      cancel: AppButton.textButton("取消", onTap: Get.back, width: 80, height: 40, radius: 30, margin: EdgeInsets.only(right: 16)),
      confirm: AppButton.button2("确定", width: 80, height: 40, onTap: (startLoading, stopLoading, btnState) {
        if (btnState == ButtonState.None) {
          startLoading();
          controller.addCompany(company).catchError((error) {
            print(error.toString());
            stopLoading();
          }).whenComplete(() => stopLoading());
        }
      }),
    );
  }
}
