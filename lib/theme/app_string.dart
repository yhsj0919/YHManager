import 'package:get/get.dart';

class AppString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'appName': '后台管理系统',
          'userName': '用户名',
          'userNameTip': '请输入正确的手机号',
          'password': '密码',
          'passWordTip': '请输入密码',
          'login': '登录',
        },
        'en_US': {
          'appName': 'Manager',
          'userName': 'UserName',
          'userNameTip': 'please Enter A Valid PhoneNumber',
          'password': 'PassWord',
          'passWordTip': 'please Enter Password',
          'login': 'Login',
        }
      };
}
