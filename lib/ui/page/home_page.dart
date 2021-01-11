import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/home_controller.dart';
import 'package:manager/ui/widget/app_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var infoNumber = context.responsiveValue(desktop: 4, tablet: 2, mobile: 2);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: infoNumber, childAspectRatio: context.width / infoNumber / 230, crossAxisSpacing: 16, mainAxisSpacing: 16),
              itemBuilder: (BuildContext context, int index) {
                return AppWidget.infoCard();
              },
            ),
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 8,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //单个子Widget的水平最大宽度
                  maxCrossAxisExtent: context.responsiveValue(desktop: 100, tablet: 100, mobile: 100),
                  //水平单个子Widget之间间距
                  mainAxisSpacing: 20.0,
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: 18.0,
                  childAspectRatio: 1 / 1),
              itemBuilder: (BuildContext context, int index) {
                return AppWidget.buttonCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
