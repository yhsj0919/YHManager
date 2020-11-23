import 'package:flutter/cupertino.dart';

class AppWidget {
  AppWidget._();

  static Widget empty({double width: 0, double height: 0}) {
    return Container(
      width: width,
      height: height,
    );
  }
}
