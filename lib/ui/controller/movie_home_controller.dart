import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/api/movie_api.dart';

class MovieHomeController extends GetxController {
  ScrollController scrollController;
  var toMenu = 0;
  var index = 0;

  RxList<Map<String, String>> movies = RxList();

  var nodes = [
    FocusScopeNode(),
    FocusScopeNode(),
    FocusScopeNode(),
    FocusScopeNode(),
    FocusScopeNode(),
    FocusScopeNode(),
  ];

  List<Map<String, dynamic>> videoTypes = [
    {'name': '片单', 'node': 1},
    {'name': '电影', 'node': 2},
    {'name': '电视', 'node': 3},
    {'name': '综艺', 'node': 4},
    {'name': '动漫', 'node': 5},
  ];

  List<String> menus = ['精选', '搜索', '更新', '我的'];

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
    getDouDan();
  }

  getDouDan() {
    MovieApi.getDouDan().then((value) {
      movies.clear();
      movies.addAll(value['data']);

      printInfo(info: '$value');
    });
  }

  //滚动列表
  bool scrollList(FocusNode node) {
    if (index == 0) {
      index = 1;
      nodes[0].requestFocus();
    } else {
      final focusedChild = node.nearestScope.focusedChild;
      scrollController.animateTo(max(scrollController.offset + focusedChild.offset.dy - node.size.height * 2, 0), duration: new Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
