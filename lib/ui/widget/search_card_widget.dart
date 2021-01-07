import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app_button.dart';
import 'blur_widget.dart';

typedef SearchItemBuild = Widget Function(BuildContext context, Function result);

class SearchItem extends StatelessWidget {
  String searchKey;
  var rasult;

  SearchItemBuild itemBuild;

  SearchItem({@required this.searchKey, @required this.itemBuild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: itemBuild.call(context, setResult),
    );
  }

  setResult(tmpResult) {
    rasult = tmpResult;
  }
}

class SearchCardWidget extends StatefulWidget {
  List<SearchItem> items = [];

  SearchCardWidget({this.items});

  @override
  _SearchCardWidgetState createState() => _SearchCardWidgetState();
}

class _SearchCardWidgetState extends State<SearchCardWidget> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
      radius: 10,
      borderWidth: 1,
      width: context.width,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[]
          ..addAll(widget.items?.take(expand ? widget.items.length : 2) ?? [])
          ..add(
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton.button("查询", onTap: () {
                  widget.items?.forEach((element) {
                    print("${element.searchKey}>>>>${element.rasult}");
                  });
                }, margin: EdgeInsets.symmetric(horizontal: 8)),
                AppButton.button("查询", onTap: () {}, margin: EdgeInsets.symmetric(horizontal: 8)),
                IconButton(
                    icon: Icon(expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                    onPressed: () {
                      setState(() {
                        expand ? expand = false : expand = true;
                      });
                    }),
              ],
            ),
          ),
      ),
    );
  }
}
