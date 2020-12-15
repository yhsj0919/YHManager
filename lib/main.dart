import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manager/theme/app_string.dart';
import 'package:manager/theme/app_theme.dart';

import 'main.mapper.g.dart';
import 'route/routes.dart';

void main() {
  initializeJsonMapper();
  runApp(MyApp());
  if (Platform.isAndroid) {
    final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      getPages: Routes.routes,
      initialRoute: Routes.Login,
      // home: TestPage(),
      translations: AppString(),
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
