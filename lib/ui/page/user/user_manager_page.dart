import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager/ui/widget/AppTextField.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/ui/widget/widget.dart';

class UserManagerPage extends StatefulWidget {
  @override
  _UserManagerPageState createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, context.height),
        child: AppWidget.menuBarWidget(
          title: [AppButton.iconButton(Icon(Icons.add), "新建", onTap: () {})],
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
          ],
          children: [
            AppTextField(label: '用户名', width: 280, fontSize: 14, height: 40),
            AppTextField(label: '手机号', width: 280, fontSize: 14, height: 40),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16.0.isMobile(def: 8.0)),
        // padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffe5e5e5)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ClipRRect(
          // 边界半径（`borderRadius`）属性，圆角的边界半径。
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: 100,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return BlurWidget(
      shadowColor: index == 5
          ? Colors.redAccent
          : index == 6
              ? Colors.green
              : null,
      color: Colors.white.withAlpha(200),
      elevation: 0,
      onTap: () {},
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 16, right: 0),
        leading: ClipRRect(
          // 边界半径（`borderRadius`）属性，圆角的边界半径。
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image.asset("images/avatar.jpg"),
        ),
        title: AppText.body("Flutter管理系统", maxLines: 1),
        subtitle: AppText.body("这是flutter实现的全端系统", maxLines: 1),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildInfo("负责人", "测试负责人").showBy(context.width > 600),
            buildInfo("开始时间", "2016-07-28 14:00:00").showBy(context.width > 600),
            linearProgress().showBy(context.width > 900),
            _popMenu(),
          ],
        ),
      ),
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: Color(0xffe5e5e5),
        ),
      ),
    );
  }

  Widget _popMenu() {
    var menu = {"编辑": Icons.edit, "删除": Icons.delete};
    return PopupMenuButton(
      tooltip: '更多',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      itemBuilder: (BuildContext context) {
        return menu.keys
            .map(
              (e) => PopupMenuItem(
                value: e,
                child: Wrap(
                  spacing: 10,
                  children: [
                    Icon(menu[e]),
                    AppText.body(e),
                  ],
                ),
              ),
            )
            .toList();
      },
      onSelected: (ww) {},
    );
  }

  Widget linearProgress() {
    var random = Random().nextDouble();
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        SizedBox(
          height: 10.0,
          width: 200.0,
          // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
          child: ClipRRect(
            // 边界半径（`borderRadius`）属性，圆角的边界半径。
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: LinearProgressIndicator(
              value: random,
              backgroundColor: Colors.blue.withAlpha(100),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          child: Text(
            '已完成%${(random * 100).toInt()}',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 8.0,
            ),
          ),
        ),
      ],
    ).marginSymmetric(horizontal: 32);
  }

  Widget buildInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText.body(title ?? '', color: Colors.black54),
        AppWidget.empty(height: 4),
        AppText.body(value ?? '', color: Colors.black54),
      ],
    ).marginSymmetric(horizontal: 32);
  }
}
