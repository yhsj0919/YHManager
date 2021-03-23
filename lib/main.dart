import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manager/theme/app_string.dart';
import 'package:manager/theme/app_theme.dart';

import 'http/sp.dart';
import 'main.mapper.g.dart';
import 'route/routes.dart';

Future<void> main() async {
  initializeJsonMapper();
  Sp.init();
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
      builder: (context, child) => Scaffold(
        // 全局隐藏键盘
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: child,
        ),
      ),
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
