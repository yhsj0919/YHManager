import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/binding/home_binding.dart';
import 'package:manager/ui/binding/login_binding.dart';
import 'package:manager/ui/binding/permission_binding.dart';
import 'package:manager/ui/binding/root_binding.dart';

import 'package:manager/ui/page/home_page.dart';
import 'package:manager/ui/page/login_page.dart';
import 'package:manager/ui/page/permission_page.dart';
import 'package:manager/ui/page/root_page.dart';
import 'package:manager/ui/widget/app_text.dart';

class Routes {
  static const Key = 1;

  static const String Root = "/";
  static const String Login = "/login";
  static const String Home = "/home";
  static const String Detail = "/detail";
  static const String Permission = "/permission";

  static List<GetPage> routes = [
    GetPage(name: Login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Root, page: () => RootPage(), binding: RootBinding()),
  ];

  static Route<dynamic> getRoute(RouteSettings settings) {
    var route = settings.name;
    var arguments = settings.arguments;

    switch (route) {
      case Home:
        return GetPageRoute(page: () => HomePage(), binding: HomeBinding(), parameter: arguments);
        break;
      case Detail:
        return GetPageRoute(page: () => HomePage(), binding: HomeBinding(), parameter: arguments);
        break;
      case Permission:
        return GetPageRoute(page: () => PermissionPage(), binding: PermissionBinding(), parameter: arguments);
        break;
      default:
        return GetPageRoute(page: () => Scaffold(body: Center(child: AppText.display1('页面不存在'))));
        break;
    }
  }
}
