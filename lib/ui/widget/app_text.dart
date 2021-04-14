import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager/ui/widget/widget.dart';

class AppText {
  AppText._();

  static Widget display4(String data, {double size = 112, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget display3(String data, {double size = 56, Color color, FontWeight fontWeight}) {
    return Text(data, style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight));
  }

  static Widget display2(String data, {double size = 45, Color color, int maxLines}) {
    return Text(data, style: TextStyle(fontSize: size, color: color), maxLines: maxLines);
  }

  static Widget display1(String data, {double size = 34, Color color, int maxLines}) {
    return Text(data, style: TextStyle(fontSize: size, color: color), maxLines: maxLines);
  }

  static Widget headline(String data, {double size = 24, Color color, int maxLines}) {
    return Text(data, style: TextStyle(fontSize: size, color: color), maxLines: maxLines);
  }

  static Widget title(String data, {double size = 30, Color color: Colors.black}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget subtitle(String data, {double size = 20, Color color: Colors.black, int maxLines}) {
    return Text(data, style: TextStyle(fontSize: size, color: color), maxLines: maxLines);
  }

  static Widget body(String data, {double size = 15, Color color: Colors.black, int maxLines}) {
    return Text(data, style: TextStyle(fontSize: size, color: color), maxLines: maxLines);
  }

  static Widget caption(String data, {double size = 13, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget button(String data, {double size = 15, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget tip(String data, {double width, double height: 40, double size = 15, Color color: Colors.red}) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: height,
      child: data.isNotEmpty == true
          ? Row(
              children: [
                Icon(
                  Icons.error,
                  color: color,
                  size: size + 5,
                ),
                Container(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    data,
                    style: TextStyle(fontSize: size, color: color),
                    maxLines: 1,
                  ),
                )
              ],
            )
          : null,
    );
  }



}
