import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Microsoft YaHei',
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.routes,
      initialRoute: Routes.Login,
    );
  }
}
