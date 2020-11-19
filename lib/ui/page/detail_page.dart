import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manager/ui/controller/detail_controller.dart';
import 'package:manager/ui/widget/app_text.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: AppText.title('详情页'),
      ),
    );
  }
}
