import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/api/app_api.dart';
import 'package:manager/entity/company_entity.dart';
import 'package:manager/entity/user_entity.dart';
import 'package:manager/ui/widget/AppTextField.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/argon_buttons_flutter.dart';
import 'package:manager/ui/widget/blur_app_bar.dart';
import 'package:manager/ui/widget/widget.dart';
import 'package:manager/utils/app_validator.dart';

class CompanyDetailPage extends StatefulWidget {
  final CompanyEntity company;
  final bool showAppBar;

  CompanyDetailPage(this.company, {this.showAppBar: false});

  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  final adminKey = GlobalKey<FormState>();
  UserEntity admin;
  String userName;
  String passWord;

  @override
  void initState() {
    super.initState();
    getCompanyAdmin(widget.company.id);
  }

  @override
  void didUpdateWidget(covariant CompanyDetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.company.id != widget.company.id) {
      setState(() {
        admin = null;
      });
      getCompanyAdmin(widget.company.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isPhone || widget.showAppBar
          ? BlurAppBar(
              title: AppText.subtitle(widget.company?.name ?? ""),
              centerTitle: true,
            )
          : null,
      body: AppWidget.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.title(widget.company?.name ?? "").isMobile(def: Container()),
          AppWidget.spanVertical25().isMobile(def: Container()),
          AppText.subtitle("详细信息"),
          AppWidget.spanVertical15(),
          Wrap(
            spacing: 15,
            children: [
              AppText.body(widget.company?.phone ?? "").icon(FaIcon(FontAwesomeIcons.phone, size: 15)),
              AppText.body(DateTime.fromMillisecondsSinceEpoch(widget.company?.expirationTime ?? 0).format('yyyy-MM-dd')).icon(FaIcon(FontAwesomeIcons.clock, size: 15)),
              AppText.body("${widget.company?.smsTotal ?? 0}").icon(FaIcon(
                FontAwesomeIcons.sms,
                size: 15,
                color: widget.company?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
              )),
              AppText.body("${widget.company?.smsCount ?? 0}").icon(FaIcon(
                FontAwesomeIcons.sms,
                size: 15,
                color: widget.company?.smsNotification == 0 ? Colors.greenAccent : Colors.redAccent,
              )),
            ],
          ),
          AppWidget.spanVertical15(),
          AppText.body(widget.company?.address ?? "未知").icon(FaIcon(FontAwesomeIcons.mapSigns, size: 15)),
          AppWidget.spanVertical15(),
          AppText.body(widget.company?.note ?? "暂无").icon(FaIcon(FontAwesomeIcons.bookmark, size: 15)),
          AppWidget.spanVertical50(),
          AppText.subtitle("管理员"),
          AppWidget.spanVertical25(),
          Form(
              key: adminKey,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 10,
                runSpacing: 10,
                // alignment: WrapAlignment.end,
                // runAlignment: WrapAlignment.end,

                children: [
                  AppTextField(
                      text: admin?.userName ?? "",
                      label: "账号",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return phoneValidator(value, "请输入正确的手机号");
                      },
                      onSaved: (value) {
                        userName = value;
                      }),
                  AppTextField(
                      text: admin?.passWord ?? "",
                      label: "密码",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return emptyValidator(value, "密码不可为空");
                      },
                      onSaved: (value) {
                        passWord = value;
                      }),
                  AppButton.button2("确定", width: 80, onTap: (startLoading, stopLoading, btnState) {
                    if (btnState == ButtonState.None) {
                      startLoading();
                      setCompanyAdmin().catchError((error) {
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
      ),
    );
  }

  ///获取管理员
  Future getCompanyAdmin(String companyId) {
    return AppApi.getCompanyAdmin(param: {"id": companyId}).then((value) {
      setState(() {
        admin = value.data;
      });
    });
  }

  ///获取管理员
  Future setCompanyAdmin() {
    if (adminKey.currentState.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      adminKey.currentState.save();

      return AppApi.setCompanyAdmin(
        param: {
          "userName": userName,
          "passWord": passWord,
          "companyId": widget.company.id,
        },
      ).then((value) {
        printInfo(info: value.toString());
      });
    } else {
      return Future.value("");
    }
  }
}
