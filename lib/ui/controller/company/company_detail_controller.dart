import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manager/api/app_api.dart';
import 'package:manager/entity/company_entity.dart';
import 'package:manager/entity/menu_entity.dart';
import 'package:manager/entity/user_entity.dart';

class CompanyDetailController extends GetxController with StateMixin<List<CompanyEntity>> {
  final adminKey = GlobalKey<FormState>();
  Rx<CompanyEntity> currentCompany = Rx(null);
  Rx<UserEntity> admin = Rx(null);
  String userName;
  String passWord;

  @override
  void onInit() {
    super.onInit();
  }

  ///详情
  void detail(CompanyEntity company) {
    currentCompany.value = company;
    getCompanyAdmin(company.id);
  }

  ///获取管理员
  Future getCompanyAdmin(String companyId) {
    return AppApi.getCompanyAdmin(param: {"id": companyId}).then((value) {
      admin.value = value.data;
      printInfo(info: admin.value?.userName);
    });
  }

  ///获取管理员
  Future setCompanyAdmin() {
    if (adminKey.currentState.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      adminKey.currentState.save();
      var user = UserEntity();
      user.userName = userName;
      user.passWord = passWord;
      user.companyId = currentCompany.value.id;
      return AppApi.setCompanyAdmin(
        param: JsonMapper.toMap(user),
      ).then((value) {
        printInfo(info: value.toString());
      });
    } else {
      return Future.value("");
    }
  }
}
