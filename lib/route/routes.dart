import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:manager/ui/page/home_page.dart';
import 'package:manager/ui/page/login_page.dart';
import 'package:manager/ui/page/movie_home_page.dart';
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
  static const String MovieHome = "/movieHome";

  static List<GetPage> routes = [
    GetPage(name: Login, page: () => LoginPage()),
    GetPage(name: Root, page: () => RootPage()),
    GetPage(name: MovieHome, page: () => MovieHomePage()),
  ];

  static Route<dynamic> getRoute(RouteSettings settings) {
    var route = settings.name;
    var arguments = settings.arguments;
    switch (route) {
      case Home:
        return GetPageRoute(page: () => HomePage(), parameter: arguments);
        break;
      case Detail:
        return GetPageRoute(page: () => HomePage(), parameter: arguments);
        break;
      case Permission:
        return GetPageRoute(page: () => PermissionPage(), parameter: arguments);
        break;
      case MovieHome:
        return GetPageRoute(page: () => MovieHomePage(), parameter: arguments);
        break;
      default:
        return GetPageRoute(page: () => Scaffold(body: Center(child: AppText.display1('页面不存在'))));
        break;
    }
  }
}
