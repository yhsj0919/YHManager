import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/binding/detail_binding.dart';
import 'package:manager/ui/binding/login_binding.dart';
import 'package:manager/ui/binding/root_binding.dart';

import 'package:manager/ui/page/detail_page.dart';
import 'package:manager/ui/page/login_page.dart';
import 'package:manager/ui/page/root_page.dart';

class Routes {
  static const Key = 1;

  static const String Root = "/";
  static const String Login = "/login";
  static const String Home = "/home";
  static const String Detail = "/detail";

  static List<GetPage> routes = [
    GetPage(name: Login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Root, page: () => RootPage(), binding: RootBinding()),
  ];

  static Route<dynamic> getRoute(RouteSettings settings) {
    var route = settings.name;
    var arguments = settings.arguments;

    switch (route) {
      case Home:
        return GetPageRoute(page: () => DetailPage(), binding: DetailBinding(), parameter: arguments);
        break;
      case Detail:
        return GetPageRoute(page: () => DetailPage(), binding: DetailBinding(), parameter: arguments);
        break;
    }
  }
}
