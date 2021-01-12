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
    var itemCount = context.responsiveValue(desktop: 8, tablet: 4, mobile: 2);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, context.height),
        child: AppWidget.menuBarWidget(
          title: [AppButton.iconButton(Icon(Icons.add), "新建", onTap: () {})],
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {}), IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: 10,
        itemBuilder: _buildItem,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: itemCount, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0, childAspectRatio: context.width / itemCount / 200),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return BlurWidget(
      radius: 10,
      elevation: 0,
      borderWidth: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.subtitle("产品名称").paddingAll(16),
          AppWidget.line(),
          AppText.body("产品名称").paddingAll(8),
          AppText.body("产品名称").paddingAll(8),
          AppWidget.line(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
