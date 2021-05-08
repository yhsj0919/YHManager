import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/ui/widget/AppTextField.dart';
import 'package:manager/ui/widget/widget.dart';

class WeighPage extends StatelessWidget {
  final leftWidth = 801.0;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 800.0.autoValue(condition: context.width < leftWidth, def: context.width),
        child: Scaffold(
          body: AppWidget.column(
            padding: 25.0.isMobile(def: 16.0),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AppWidget.row(
                    children: [
                      buildWeight(""),
                      AppWidget.spanHorizontal25().isMobile(def: AppWidget.spanHorizontal10()),
                      buildWeight(""),
                      AppWidget.spanHorizontal25().isMobile(def: AppWidget.spanHorizontal10()),
                      buildWeight(""),
                      AppWidget.spanHorizontal25().isMobile(def: AppWidget.spanHorizontal10()),
                      buildWeight(""),
                    ],
                  )),
              AppWidget.spanVertical25(),
              AppTextField(
                width: double.infinity,
                fontSize: 30,
              ).icon(FaIcon(FontAwesomeIcons.carAlt, size: 60), alignment: CrossAxisAlignment.end),
              AppWidget.spanVertical25(),
              ToggleButtons(
                selectedColor: Colors.blue,
                splashColor: Colors.blue,
                children: <Widget>[
                  Container(
                    color: Colors.white70,
                    width: 130,
                    alignment: Alignment.center,
                    child: Text("零售", style: TextStyle(fontSize: 25)),
                  ),
                  Container(
                    color: Colors.white70,
                    width: 130,
                    alignment: Alignment.center,
                    child: Text("客户", style: TextStyle(fontSize: 25)),
                  ),
                ],
                onPressed: (index) {},
                isSelected: [true, false],
              ),
            ],
          ),
          floatingActionButton: AppButton.button2(
              radius: 30,
              height: 55,
              width: 55,
              elevation: 5,
              background: Colors.blue,
              loadingColor: Colors.white,
              child: Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ),
              onTap: () {
                return Future.delayed(Duration(seconds: 3));
              }),
        ),
      ),
      Container(
        width: 1,
        height: context.height,
        color: Colors.black12,
      ).autoValue(condition: context.width < leftWidth, def: Container()),
      Container().autoValue(condition: context.width < leftWidth, def: Container()),
    ]);
  }

  Widget buildWeight(text) {
    return Container(
      width: 168.0.isMobile(def: 82.0),
      height: 100.0.isMobile(def: 60.0),
      color: Colors.black87,
      alignment: Alignment.center,
      child: Text(
        "$text",
        style: TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}
