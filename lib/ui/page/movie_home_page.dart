import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/movie_home_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/blur_widget.dart';
import 'package:manager/ui/widget/focus_widget.dart';
import 'package:manager/utils/app_ext.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieHomePage extends StatelessWidget {
  final MovieHomeController controller = Get.put(MovieHomeController());

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
                autofocus: true,
                node: controller.nodes[0],
                child: ListView.builder(
                  itemCount: controller.menus.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildMenu(controller.menus[index]);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.videoTypes.map((e) => _buidVideoType(e)).toList(),
              ),
            ).paddingOnly(left: 50, right: 50, top: 16, bottom: 16),
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
          height: 140,
          child: FocusScope(
            node: controller.nodes[info['node'].toInt()],
            child: Obx(
              () => ListView.builder(
                itemCount: controller.movies.length,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMovieItem(controller.movies[index]).keyListener(onkey: (event) {
                    if (event.logicalKey == LogicalKeyboardKey.arrowLeft && index == 0) {
                      controller.toMenu++;
                      if (controller.toMenu > 1) {
                        controller.nodes[0].requestFocus();
                      }
                    } else {
                      controller.toMenu = 0;
                    }

                    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                      if (index == 0) {
                        controller.toMenu++;
                      }

                      if (controller.nodes.length > info['node'].toInt() + 1) {
                        controller.nodes[info['node'].toInt() + 1].requestFocus();
                      }
                    }
                    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                      if (index == 0) {
                        controller.toMenu++;
                      }
                      if (info['node'].toInt() - 1 > 0) {
                        controller.nodes[info['node'].toInt() - 1].requestFocus();
                      }
                    }
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenu(String item) {
    return FocusWidget(
        autofocus: true,
        build: (context, node, focused) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: AppText.headline("$item", color: focused ? Colors.black87 : Colors.grey),
          );
        }).keyListener(onkey: (event) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        controller.nodes[1].requestFocus();
      }
    });
  }

  Widget _buildMovieItem(Map<String, String> movie) {
    return FocusWidget(
        autofocus: true,
        build: (context, node, focused) {
          if (focused) {
            controller.scrollList(node);
          }
          return Container(
            padding: EdgeInsets.all(focused ? 0 : 8),
            margin: EdgeInsets.all(8),
            width: 120,
            height: 160,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(imageUrl: '${movie['cover']}'),
                focused
                    ? BlurWidget(
                        margin: 0,
                        padding: 0,
                        radius: 0,
                        height: 30,
                        child: AppText.body('${movie['title']}', size: 10),
                        color: Colors.white54,
                      )
                    : Container()
              ],
            ),
          );
        });
  }
}
