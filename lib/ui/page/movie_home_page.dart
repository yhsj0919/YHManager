import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/movie_home_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/focus_widget.dart';

class MovieHomePage extends GetView<MovieHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 0.0), //阴影xy轴偏移量
                      blurRadius: 8.0, //阴影模糊程度
                      spreadRadius: 1.0 //阴影扩散程度
                      )
                ],
              ),
              child: Column(
                children: [
                  Container(height: 100),
                  FocusWidget(build: (context, node, focused) {
                    return AppText.headline("精选", color: focused ? Colors.black87 : Colors.grey);
                  }),
                  Container(height: 24),
                  FocusWidget(build: (context, node, focused) {
                    return AppText.headline("搜索", color: focused ? Colors.black87 : Colors.grey);
                  }),
                  Container(height: 24),
                  FocusWidget(build: (context, node, focused) {
                    return AppText.headline("更新", color: focused ? Colors.black87 : Colors.grey);
                  }),
                  Container(height: 24),
                  FocusWidget(build: (context, node, focused) {
                    return AppText.headline("我的", color: focused ? Colors.black87 : Colors.grey);
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(),
          )
        ],
      ),
    );
  }
}
