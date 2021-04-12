import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/ui/controller/company_controller.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/widget.dart';

class CompanyDetailPage extends StatelessWidget {
  final CompanyController controller = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.title(controller.currentCompany.value?.name ?? "").icon(FaIcon(FontAwesomeIcons.idCard)),
              AppWidget.empty(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText.subtitle(controller.currentCompany.value?.phone ?? "").icon(FaIcon(FontAwesomeIcons.phone, size: 16)),
                  AppWidget.empty(width: 24),
                  AppText.subtitle(DateTime.fromMillisecondsSinceEpoch(controller.currentCompany.value?.expirationTime ?? 0).format('yyyy-MM-dd'))
                      .icon(FaIcon(FontAwesomeIcons.clock, size: 16)),
                  AppWidget.empty(width: 24),
                  AppText.subtitle("${controller.currentCompany.value?.smsTotal ?? 0}").icon(FaIcon(
                    FontAwesomeIcons.sms,
                    size: 16,
                    color: controller.currentCompany.value?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
                  )),
                  AppWidget.empty(width: 24),
                  AppText.subtitle("${controller.currentCompany.value?.smsCount ?? 0}").icon(FaIcon(
                    FontAwesomeIcons.sms,
                    size: 16,
                    color: controller.currentCompany.value?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
                  )),
                ],
              ),
              AppWidget.empty(height: 16),
              AppText.subtitle(controller.currentCompany.value?.address ?? "").icon(FaIcon(FontAwesomeIcons.mapSigns, size: 16)),
              AppWidget.empty(height: 16),
              AppText.subtitle(controller.currentCompany.value?.note ?? "").icon(FaIcon(FontAwesomeIcons.bookmark, size: 16)),
              AppWidget.empty(height: 16),
              AppText.title("管理员"),
              AppWidget.empty(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText.textField(label: "账号"),
                  AppWidget.empty(width: 8),
                  AppText.textField(label: "密码"),
                  AppWidget.empty(width: 8),
                  AppButton.button("确定", onTap: () {}, height: 35),
                ],
              ),
              AppWidget.empty(height: 8),
              AppText.title("权限"),
              AppWidget.empty(height: 8),
            ],
          ),
        ));
  }
}
