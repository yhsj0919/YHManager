import 'package:flutter/material.dart';
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
          title: [
            AppButton.iconButton(Icon(Icons.add), "新建", onTap: () {}),
          ],
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            alignment: Alignment.center,
            color: Colors.blue,
            child: AppText.title("$index"),
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //单个子Widget的水平最大宽度
            maxCrossAxisExtent: 200,
            //水平单个子Widget之间间距
            mainAxisSpacing: 20.0,
            //垂直单个子Widget之间间距
            crossAxisSpacing: 10.0,
        childAspectRatio: 2/3),
      ),
    );
  }
}
