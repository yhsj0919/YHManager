import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'app_shape.dart';
import 'app_text.dart';
import 'argon_buttons_flutter.dart';

class AppButton {
  AppButton._();

  static Widget button(String text,
      {VoidCallback onTap,
        double width,
        double height,
        Color background: Colors.blue,
        Color textColor: Colors.white,
        EdgeInsetsGeometry padding,
        EdgeInsetsGeometry margin,
        double radius: 8}) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all(AppShape.circular(radius: radius)),
          textStyle: MaterialStateProperty.all(TextStyle(color: textColor)),
        ),
        onPressed: onTap,
        child: AppText.button(text),
      ),
    );
  }

  static Widget iconButton(Widget icon, String text,
      {VoidCallback onTap,
        double width,
        double height,
        Color background: Colors.blue,
        Color textColor: Colors.white,
        EdgeInsetsGeometry padding,
        EdgeInsetsGeometry margin,
        double radius: 8}) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)),
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all(AppShape.circular(radius: radius)),
          textStyle: MaterialStateProperty.all(TextStyle(color: textColor)),
        ),
        onPressed: onTap,
        label: AppText.button(text),
        icon: icon,
      ),
    );
  }

  static Widget button2(String text,
      {double width,
        double height: 50,
        Color background,
        Color textColor: Colors.white,
        EdgeInsetsGeometry padding,
        EdgeInsetsGeometry margin,
        double radius: 50,
        ArgonButtonTap onTap}) {
    return Container(
      margin: margin,
      child: ArgonButton(
        width: width,
        height: height,
        elevation: 2,
        focusElevation: 2,
        disabledElevation: 2,
        borderRadius: radius,
        loader: Container(padding: EdgeInsets.all(10), child: SpinKitRotatingCircle(color: Colors.white)),
        highlightColor: Colors.black12,
        splashColor: Colors.black12,
        onTap: onTap,
        child: AppText.button(text, color: textColor),
        color: background ?? Colors.blue,
      ),
    );
  }

  static Widget textButton(String text, {VoidCallback onTap, double width, double height, Color background, Color textColor, EdgeInsetsGeometry margin}) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: TextButton(
        onPressed: onTap,
        child: AppText.button(text, color: textColor),
      ),
    );
  }

  static Widget outlineButton(String text,
      {VoidCallback onTap, Color background: Colors.white, Color borderColor: Colors.grey, textColor, EdgeInsetsGeometry padding, EdgeInsetsGeometry margin, double radius: 8}) {
    return Container(
      margin: margin,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: borderColor, width: 0.5)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)),
          shape: MaterialStateProperty.all(AppShape.circular(radius: radius)),
          textStyle: MaterialStateProperty.all(TextStyle(color: textColor)),
        ),
        onPressed: onTap,
        child: AppText.button(text),
      ),
    );
  }
}