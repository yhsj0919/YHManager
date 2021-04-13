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
    return Obx(() => AppWidget.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.title("公司信息"),
            AppWidget.spanVertical25(),
            AppText.subtitle(controller.currentCompany.value?.name ?? "").icon(FaIcon(FontAwesomeIcons.idCard)),
            AppWidget.spanVertical25(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.subtitle(controller.currentCompany.value?.phone ?? "").icon(FaIcon(FontAwesomeIcons.phone, size: 16)),
                AppWidget.spanHorizontal25(),
                AppText.subtitle(DateTime.fromMillisecondsSinceEpoch(controller.currentCompany.value?.expirationTime ?? 0).format('yyyy-MM-dd'))
                    .icon(FaIcon(FontAwesomeIcons.clock, size: 16)),
                AppWidget.spanHorizontal25(),
                AppText.subtitle("${controller.currentCompany.value?.smsTotal ?? 0}").icon(FaIcon(
                  FontAwesomeIcons.sms,
                  size: 16,
                  color: controller.currentCompany.value?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
                )),
                AppWidget.spanHorizontal25(),
                AppText.subtitle("${controller.currentCompany.value?.smsCount ?? 0}").icon(FaIcon(
                  FontAwesomeIcons.sms,
                  size: 16,
                  color: controller.currentCompany.value?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
                )),
              ],
            ),
            AppWidget.spanVertical25(),
            AppText.subtitle(controller.currentCompany.value?.address ?? "").icon(FaIcon(FontAwesomeIcons.mapSigns, size: 16)),
            AppWidget.spanVertical25(),
            AppText.subtitle(controller.currentCompany.value?.note ?? "").icon(FaIcon(FontAwesomeIcons.bookmark, size: 16)),
            AppWidget.spanVertical25(),
            AppText.body("管理员"),
            AppWidget.spanVertical5(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.textField(label: "账号"),
                AppWidget.spanHorizontal10(),
                AppText.textField(label: "密码"),
                AppWidget.spanHorizontal10(),
                AppButton.button("确定", onTap: () {}),
              ],
            ),
            AppWidget.spanVertical25(),
            AppText.body("权限"),
            AppWidget.spanVertical5(),
          ],
        ));
  }
}
