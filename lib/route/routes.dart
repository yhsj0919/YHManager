import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/page/error/not_found_page.dart';
import 'package:manager/ui/page/error/server_error_page.dart';

import 'package:manager/ui/page/home_page.dart';
import 'package:manager/ui/page/login_page.dart';
import 'package:manager/ui/page/movie_home_page.dart';
import 'package:manager/ui/page/permission_page.dart';
import 'package:manager/ui/page/root_page.dart';
import 'package:manager/ui/page/user/user_manager_page.dart';
import 'package:manager/ui/widget/app_text.dart';

class Routes {
  static const Key = 1;
  static const String Root = "/";
  static const String Login = "/login";
  static const String Home = "/home";
  static const String Detail = "/detail";
  static const String Permission = "/permission";
  static const String MovieHome = "/movieHome";
  static const String Error500 = "/error500";
  static const String UserManager = "/userManager";

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
      case UserManager:
        return GetPageRoute(page: () => UserManagerPage(), parameter: arguments);
        break;
      case Error500:
        return GetPageRoute(page: () => ServerErrorPage());
        break;
      default:
        return GetPageRoute(page: () => NotFoundPage());
        break;
    }
  }
}
