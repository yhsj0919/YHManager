import 'dart:core';

import 'package:flutter/material.dart';
import 'package:manager/ui/widget/widget.dart';

class AppTextField extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autoValidateMode;
  final TextInputType inputType;
  final TextStyle style;
  final bool enable;
  final String label;
  final String hint;
  final String error;
  final String help;

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
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    error = null;
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      selectionController.text = widget.text;
    });
  }

  @override
  void initState() {
    super.initState();
    selectionController = TextEditingController(text: widget.text);
    error = widget.error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
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
            height: widget.height,
            child: TextFormField(
              controller: selectionController,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              validator: (value) {
                var text = widget.validator(value);

                if (error != text) {
                  error = text;
                  Future.delayed(Duration(milliseconds: 0)).then((value) => setState(() {}));
                }
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
      ),
    );
  }
}
