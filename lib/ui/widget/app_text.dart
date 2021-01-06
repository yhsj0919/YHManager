import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  static Widget title(String data, {double size = 21, Color color}) {
    return Text(data, style: TextStyle(fontSize: size, color: color));
  }

  static Widget subtitle(String data, {double size = 17, Color color, int maxLines}) {
    return Text(data, style: TextStyle(fontSize: size, color: color), maxLines: maxLines);
  }

  static Widget body(String data, {double size = 15, Color color, int maxLines}) {
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

  static Widget textField({
    String text,
    double width: 200,
    double height,
    double fontSize,
    ValueChanged<String> onChanged,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    AutovalidateMode autoValidateMode,
    TextInputType inputType,
    TextStyle style,
    bool enable,
    String label,
    String hint,
    String error,
    String help,
  }) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        initialValue: text ?? '',
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        autovalidateMode: autoValidateMode,
        autofocus: false,
        focusNode: FocusNode(canRequestFocus: false),
        keyboardType: inputType,
        style: style ?? TextStyle(fontSize: fontSize),
        maxLines: 1,
        enabled: enable,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          labelText: label,
          border: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: hint ?? '',
          hintStyle: TextStyle(color: Colors.grey),
          errorText: error,
          errorMaxLines: 1,
          helperText: help,
          helperMaxLines: 1,
        ),
      ),
    );
  }
}
