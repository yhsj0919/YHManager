import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/entity/company_entity.dart';
import 'package:manager/entity/user_entity.dart';
import 'package:manager/ui/controller/company/company_detail_controller.dart';
import 'file:///D:/Server/YHManager/lib/ui/controller/company/company_controller.dart';
import 'package:manager/ui/widget/AppTextField.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/argon_buttons_flutter.dart';
import 'package:manager/ui/widget/widget.dart';
import 'package:manager/utils/app_validator.dart';

class CompanyDetailPage extends StatelessWidget {
  final CompanyDetailController controller = Get.put(CompanyDetailController());

  CompanyDetailPage(CompanyEntity companyEntity) {
    controller.detail(companyEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppWidget.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.title(controller.currentCompany.value?.name ?? ""),
            AppWidget.spanVertical25(),
            AppText.subtitle("详细信息"),
            AppWidget.spanVertical15(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.body(controller.currentCompany.value?.phone ?? "").icon(FaIcon(FontAwesomeIcons.phone, size: 15)),
                AppWidget.spanHorizontal25(),
                AppText.body(DateTime.fromMillisecondsSinceEpoch(controller.currentCompany.value?.expirationTime ?? 0).format('yyyy-MM-dd'))
                    .icon(FaIcon(FontAwesomeIcons.clock, size: 15)),
                AppWidget.spanHorizontal25(),
                AppText.body("${controller.currentCompany.value?.smsTotal ?? 0}").icon(FaIcon(
                  FontAwesomeIcons.sms,
                  size: 15,
                  color: controller.currentCompany.value?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
                )),
                AppWidget.spanHorizontal25(),
                AppText.body("${controller.currentCompany.value?.smsCount ?? 0}").icon(FaIcon(
                  FontAwesomeIcons.sms,
                  size: 15,
                  color: controller.currentCompany.value?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
                )),
              ],
            ),
            AppWidget.spanVertical15(),
            AppText.body(controller.currentCompany.value?.address ?? "未知").icon(FaIcon(FontAwesomeIcons.mapSigns, size: 15)),
            AppWidget.spanVertical15(),
            AppText.body(controller.currentCompany.value?.note ?? "暂无").icon(FaIcon(FontAwesomeIcons.bookmark, size: 15)),
            AppWidget.spanVertical50(),
            AppText.subtitle("管理员"),
            AppWidget.spanVertical25(),
            Form(
                key: controller.adminKey,
                child: AppWidget.row(
                  children: [
                    AppTextField(
                        text: controller.admin?.value?.userName ?? "",
                        label: "账号",
                        validator: (value) {
                          return phoneValidator(value, "请输入正确的手机号");
                        },
                        onSaved: (value) {
                          controller.userName = value;
                        }),
                    AppWidget.spanHorizontal10(),
                    AppTextField(
                        text: controller.admin?.value?.passWord ?? "",
                        label: "密码",
                        validator: (value) {
                          return emptyValidator(value, "密码不可为空");
                        },
                        onSaved: (value) {
                          controller.passWord = value;
                        }),
                    AppWidget.spanHorizontal10(),
                    AppButton.button2("确定", width: 80, onTap: (startLoading, stopLoading, btnState) {
                      if (btnState == ButtonState.None) {
                        startLoading();

                        controller.setCompanyAdmin().catchError((error) {
                          print(error.toString());
                          stopLoading();
                        }).whenComplete(() => stopLoading());
                      }
                    }),
                  ],
                )),
            AppWidget.spanVertical25(),
            AppText.subtitle("权限"),
            AppWidget.spanVertical5(),
          ],
        ));
  }
}
