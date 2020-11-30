import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MovieHomeController extends GetxController {
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
}
