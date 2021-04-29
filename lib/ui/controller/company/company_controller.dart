import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manager/api/app_api.dart';
import 'package:manager/entity/company_entity.dart';

class CompanyController extends GetxController with StateMixin<List<CompanyEntity>> {
  final formKey = GlobalKey<FormState>();
  Rx<Widget> companyDetail = Rx(Container());
  List<CompanyEntity> companies = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 200)).then((value) => getCompany());
  }

  /// 获取公司
  Future getCompany() {
    change(companies, status: RxStatus.loading());
    return AppApi.getCompany().then((value) {
      companies.clear();
      companies.addAll(value.data);
      change(companies, status: RxStatus.success());
    }).catchError((error) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  ///添加公司
  Future addCompany(CompanyEntity company) {
    if (formKey.currentState.validate()) {
      ///只有输入的内容符合要求通过才会到达此处
      formKey.currentState.save();
      return AppApi.addCompany(param: JsonMapper.toMap(company)).then((value) {
        companies.add(value.data);
        change(companies, status: RxStatus.success());
        Get.back();
      });
    } else {
      return Future.value("");
    }
  }
}
