import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Text(''),
      ),
    );
  }
}
