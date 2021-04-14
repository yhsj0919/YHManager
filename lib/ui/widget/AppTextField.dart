import 'dart:core';

import 'package:flutter/material.dart';
import 'package:manager/ui/widget/widget.dart';

class AppTextField extends StatefulWidget {
  String text;
  double width;
  double height;
  double fontSize;
  ValueChanged<String> onChanged;
  FormFieldSetter<String> onSaved;
  FormFieldValidator<String> validator;
  AutovalidateMode autoValidateMode;
  TextInputType inputType;
  TextStyle style;
  bool enable;
  String label;
  String hint;
  String error;
  String help;

  AppTextField({
    this.text,
    this.width: 200,
    this.height: 35,
    this.fontSize,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.autoValidateMode,
    this.inputType,
    this.style,
    this.enable,
    this.label,
    this.hint,
    this.error,
    this.help,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController selectionController;
  String error;

  @override
  void initState() {
    super.initState();
    selectionController = TextEditingController();
    selectionController.text = widget.text;
    error = widget.error;
  }

  @override
  Widget build(BuildContext context) {
    selectionController.text = widget.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AppText.body(widget.label ?? ""),
            AppWidget.spanHorizontal10(),
            error == null ? Container() : AppText.body(error ?? "", color: Colors.red, size: 12),
          ],
        ),
        Container(
          width: widget.width,
          height: widget.height ?? 35,
          child: TextFormField(
            controller: selectionController,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            validator: (value) {
              var text = widget.validator(value);
              error = text;
              setState(() {});
              return text;
            },
            autovalidateMode: widget.autoValidateMode,
            autofocus: false,
            focusNode: FocusNode(canRequestFocus: false),
            keyboardType: widget.inputType,
            style: widget.style ?? TextStyle(fontSize: widget.fontSize),
            maxLines: 1,
            enabled: widget.enable,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              border: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(0))),
              hintText: widget.hint ?? '',
              hintStyle: TextStyle(color: Colors.grey),
              errorText: error,
              errorStyle: TextStyle(fontSize: 0, height: 0),
              helperText: widget.help,
              helperMaxLines: 1,
            ),
          ),
        )
      ],
    );
  }
}
