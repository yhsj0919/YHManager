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
    this.height,
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

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      selectionController.text = widget.text;
    });
  }

  @override
  void initState() {
    super.initState();
    selectionController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      // height: widget.height,
      constraints: BoxConstraints(minHeight: 82),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.body(widget.label ?? ""),
          AppWidget.span(height: 2),
          TextFormField(
            controller: selectionController,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
            autofocus: false,
            focusNode: FocusNode(canRequestFocus: false),
            keyboardType: widget.inputType,
            style: widget.style ?? TextStyle(fontSize: widget.fontSize),
            maxLines: 1,
            enabled: widget.enable,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              border: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(0))),
              hintText: widget.hint ?? '',
              hintStyle: TextStyle(color: Colors.grey),
              errorText: widget.error,
              errorStyle:TextStyle(fontSize: 12),
              helperText: widget.help,
              helperMaxLines: 1,
            ),
          ),
          Flexible(child: Container(),flex: 1,),
        ],
      ),
    );
  }
}
