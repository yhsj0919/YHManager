import 'package:flutter/material.dart';

class MenuEntity {
  MenuEntity({this.icon, this.name, this.expanded = false, this.child});

  String name;
  IconData icon;
  bool expanded;
  List<MenuEntity> child = List();
}
