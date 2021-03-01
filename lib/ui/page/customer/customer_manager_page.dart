import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/ui/widget/widget.dart';

class CustomerManagerPage extends StatefulWidget {
  @override
  _CustomerManagerPageState createState() => _CustomerManagerPageState();
}

class _CustomerManagerPageState extends State<CustomerManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 500.0.autoValue(condition: context.width < 720, def: context.width - 32),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe5e5e5)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              // 边界半径（`borderRadius`）属性，圆角的边界半径。
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: _buildItem,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BlurWidget(
              margin: EdgeInsets.only(top: 16, right: 16, bottom: 16),
              borderWidth: 1,
              radius: 10,
              elevation: 0,
              child: Container(),
            ),
          ).showBy(context.width > 720),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var random = Random().nextDouble();
    return BlurWidget(
      color: Colors.white.withAlpha(200),
      elevation: 0,
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            AppText.title("永恒瞬间技术有限公司$index").expanded(),
            AppText.subtitle("${(random * 5000000).toStringAsFixed(2)}", color: Colors.green).icon(Icon(Icons.money, color: Colors.green, size: 20)),
            _popMenu(),
          ]),
          AppWidget.empty(height: 12),
          Row(children: [
            AppText.subtitle("${(random * 100000000).toStringAsFixed(2)}", color: Colors.orange).icon(Icon(Icons.account_balance_wallet, color: Colors.orange, size: 20)).expanded(),
            AppText.subtitle("${(random * 500).toStringAsFixed(2)}", color: Colors.redAccent).icon(Icon(Icons.money_off, color: Colors.redAccent, size: 20)),
            AppWidget.empty(width: 45),
          ]),
          AppWidget.empty(height: 12),
          Row(
            children: [
              AppText.subtitle("${DateTime.fromMillisecondsSinceEpoch(1610436144555).format('Y-m-d H:i')}"),
            ],
          )
        ],
      ).paddingOnly(left: 16, top: 8, bottom: 16),
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
      padding: EdgeInsets.all(0),
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
