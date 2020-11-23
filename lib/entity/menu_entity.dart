import 'package:flutter/material.dart';

class MenuEntity {
  String id;

  //父级
  String parent;

  //名称
  String name;

  //类型，0，菜单，1，接口
  int type;

  //权重，用于排序
  int weight;

  //路径
  String path;

  //图标
  IconData icon;

  //展开
  bool expanded;

  //子集
  List<MenuEntity> child = List();

  MenuEntity({this.id, this.parent, this.type, this.path, this.weight, this.icon, this.name, this.expanded = false, this.child});
}
