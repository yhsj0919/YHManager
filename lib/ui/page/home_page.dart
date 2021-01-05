import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/ui/controller/home_controller.dart';
import 'package:manager/ui/widget/app_text.dart';
import 'package:manager/ui/widget/app_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var number = context.isLargeTablet
        ? 4
        : context.isSmallTablet
            ? 2
            : 1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: number, childAspectRatio: context.width / number / 240,crossAxisSpacing: 16,mainAxisSpacing: 16),
              itemBuilder: (BuildContext context, int index) {
                return AppWidget.card();
              },
            ),
          ],
        ),
      ),
    );
  }
}
