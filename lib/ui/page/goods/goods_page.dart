import 'package:flutter/material.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/ui/widget/widget.dart';

class GoodsPage extends StatefulWidget {
  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, context.height),
        child: AppWidget.menuBarWidget(
          title: [AppButton.iconButton(Icon(Icons.add), "新建", onTap: () {})],
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {}), IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
        ),
      ),
      body: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: List.generate(20, (int index) => _buildItem(context, index)),
      ).paddingAll(16),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return BlurWidget(
      width: 153,
      elevation: 0,
      borderWidth: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.subtitle("产品名称"),
          AppWidget.spanVertical5(),
          AppWidget.line(),
          AppWidget.spanVertical5(),
          AppText.body("产品名称"),
          AppWidget.spanVertical5(),
          AppText.body("产品名称"),
          AppWidget.spanVertical5(),
          AppWidget.line(),
          AppWidget.row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 18,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 18,
                  ),
                  onPressed: () {}),
            ],
          )
        ],
      ).paddingOnly(top: 10, left: 10, right: 10),
    );
  }
}
