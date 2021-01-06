import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/utils/ext.dart';

class UserManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlurWidget(
              radius: 10,
              borderWidth: 1,
              child: ExpansionTile(
                title: AppText.title("标题"),
                initiallyExpanded: true,
                childrenPadding: const EdgeInsets.all(20),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
              )),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    AppText.textField(label: '用户名', width: 300, fontSize: 14, height: 40),
                    AppText.textField(label: '手机号', width: 300, fontSize: 14, height: 40),
                  ],
                ),
              ),
              Wrap(
                direction: Axis.horizontal.isMobile(def: Axis.vertical),
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0.isMobile(def: 15.0),
                //主轴上子控件的间距
                children: [
                  AppButton.button("查询", onTap: () {}, margin: EdgeInsets.symmetric(horizontal: 8)),
                  AppButton.button("取消", onTap: () {}, margin: EdgeInsets.symmetric(horizontal: 8)),
                ],
              ),
            ],
          )
        ],
      ).paddingAll(16),
      floatingActionButton: BlurWidget(
        width: 55,
        height: 55,
        radius: 50,
        elevation: 2,
        shadowColor: Color(0x660000ff),
        color: Color(0x660000ff),
        child: Icon(Icons.add, color: Colors.black87),
        onTap: () {},
      ),
    );
  }
}
