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
                Flexible(child:Text(
                  data,
                  style: TextStyle(fontSize: size, color: color),
                  maxLines: 1,
                ) ,)

              ],
            )
          : null,
    );
  }

  static Widget textField({
    String text,
    TextEditingController controller,
    ValueChanged<String> onChanged,
    TextInputType inputType,
    TextStyle style,
    bool enable,
    String hint,
    String error,
    String help,
  }) {
    controller?.text = text ?? '';
    return TextField(
      controller: controller ?? TextEditingController(text: text ?? ''),
      onChanged: onChanged,
      autofocus: false,
      focusNode: FocusNode(canRequestFocus: false),
      keyboardType: inputType,
      style: style ?? TextStyle(fontSize: 18, color: Color(0xff1f98f5)),
      maxLines: 3,
      enabled: enable,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide()),
        hintText: hint ?? '',
        hintStyle: TextStyle(color: Colors.grey),
        errorText: error,
        errorMaxLines: 1,
        helperText: help,
        helperMaxLines: 1,
      ),
    );
  }
}
