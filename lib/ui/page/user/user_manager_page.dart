import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/widget/app_button.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/ui/widget/expansion_widget.dart';
import 'package:manager/ui/widget/search_card_widget.dart';

class UserManagerPage extends StatefulWidget {
  @override
  _UserManagerPageState createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          ExpansionWidget(
            expandedAlignment: Alignment.topLeft,
            title: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40),
                AppText.textField(label: '手机号', width: 280, fontSize: 14, height: 40),
              ],
            ),
            children: [
              AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40),
              AppText.textField(label: '手机号', width: 280, fontSize: 14, height: 40),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.button("查询", onTap: () {}, margin: EdgeInsets.symmetric(horizontal: 8)),
              AppButton.button("取消", onTap: () {}, margin: EdgeInsets.symmetric(horizontal: 8)),
            ],
          ),
          SearchCardWidget(
            items: [
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
              SearchItem(
                searchKey: 'name',
                itemBuild: (BuildContext context, Function result) {
                  return AppText.textField(label: '用户名', width: 280, fontSize: 14, height: 40, onChanged: result);
                },
              ),
            ],
          ),
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
