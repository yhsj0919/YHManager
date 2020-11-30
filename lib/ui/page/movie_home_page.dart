import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/movie_home_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/focus_widget.dart';
import 'package:manager/utils/app_ext.dart';

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
              child: FocusScope(
                node: controller.nodes[0],
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return FocusWidget(
                        autofocus: false,
                        build: (context, node, focused) {
                          return AppText.headline("精选", color: focused ? Colors.black87 : Colors.grey);
                        }).keyListener(onkey: (event) {
                      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                        controller.nodes[1].requestFocus();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.videoTypes.map((e) => _buidVideoType(e)).toList(),
              ),
            ).paddingOnly(left: 50, right: 50, top: 50, bottom: 16),
          )
        ],
      ),
    );
  }

  Widget _buidVideoType(Map<String, dynamic> info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.title('${info['name']}'),
        SizedBox(
          height: 176,
          child: FocusScope(
            node: controller.nodes[info['node'].toInt()],
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return FocusWidget(
                    autofocus: true,
                    build: (context, node, focused) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        width: 120,
                        height: 160,
                        color: focused ? Colors.lightBlueAccent : Colors.blueGrey,
                      );
                    }).keyListener(onkey: (event) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowLeft && index == 0) {
                    controller.nodes[0].requestFocus();
                  }

                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    if (controller.nodes.length > info['node'].toInt() + 1) {
                      controller.nodes[info['node'].toInt() + 1].requestFocus();
                    }
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    if (info['node'].toInt() - 1 > 0) {
                      controller.nodes[info['node'].toInt() - 1].requestFocus();
                    }
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
