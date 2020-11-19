import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText {
  static Widget display4(String data, {double size = 112, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget display3(String data, {double size = 56, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget display2(String data, {double size = 45, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget display1(String data, {double size = 34, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget headline(String data, {double size = 24, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget title(String data, {double size = 21, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget subtitle(String data, {double size = 17, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget body(String data, {double size = 15, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget caption(String data, {double size = 13, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget button(String data, {double size = 15, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }
}
