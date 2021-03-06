import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/home_controller.dart';
import 'package:manager/ui/widget/app_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var infoNumber = context.responsiveValue(desktop: 4, tablet: 2, mobile: 1);

    var buttonNumber = context.responsiveValue(desktop: 8, tablet: 6, mobile: 4);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: infoNumber, childAspectRatio: context.width / infoNumber / 220, crossAxisSpacing: 16, mainAxisSpacing: 16),
              itemBuilder: (BuildContext context, int index) {
                return AppWidget.infoCard();
              },
            ),
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 8,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: buttonNumber, childAspectRatio: context.width / buttonNumber / 110, crossAxisSpacing: 16, mainAxisSpacing: 16),
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
