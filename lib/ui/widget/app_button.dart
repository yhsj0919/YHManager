import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_shape.dart';
import 'app_text.dart';

class AppButton {
  static Widget button(String text, VoidCallback onPressed,
      {double width, Color background: Colors.blue, Color textColor: Colors.white, EdgeInsetsGeometry padding, EdgeInsetsGeometry margin, ShapeBorder shape}) {
    return Container(
      width: width,
      margin: margin,
      child: MaterialButton(
        elevation: 2,
        focusElevation: 2,
        disabledElevation: 2,
        highlightColor: Colors.black12,
        splashColor: Colors.black12,
        onPressed: onPressed,
        child: AppText.button(text),
        padding: padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        color: background,
        textColor: textColor,
        shape: shape ?? AppShape.circular(),
      ),
    );
  }

  static Widget textButton(String text, VoidCallback onPressed, {Color background, Color textColor, EdgeInsetsGeometry margin}) {
    return Container(
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        child: AppText.button(text, color: textColor),
      ),
    );
  }

  static Widget outlineButton(String text, VoidCallback onPressed, {Color background, Color textColor, EdgeInsetsGeometry padding, EdgeInsetsGeometry margin, ShapeBorder shape}) {
    return Container(
      margin: margin,
      child: OutlineButton(
        onPressed: onPressed,
        borderSide: BorderSide(color: background, width: 1),
        child: AppText.button(text),
        padding: padding,
        color: background,
        textColor: textColor,
        shape: shape,
      ),
    );
  }
}
