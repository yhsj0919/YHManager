import 'package:flutter/material.dart';
import 'package:manager/ui/widget/widget.dart';

class WeighPage extends StatelessWidget {
  final leftWidth = 801;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 800.0.autoValue(condition: context.width < leftWidth, def: context.width),
        child: Scaffold(
          body: Container(),
          floatingActionButton: AppButton.button2(
              radius: 30,
              height: 55,
              width: 55,
              elevation: 5,
              background: Colors.blue,
              loadingColor: Colors.white,
              child: Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ),
              onTap: () {
                return Future.delayed(Duration(seconds: 3));
              }),
        ),
      ),
      Container(
        width: 1,
        height: context.height,
        color: Colors.black12,
      ).autoValue(condition: context.width < leftWidth, def: Container()),
      Container().autoValue(condition: context.width < leftWidth, def: Container()),
    ]);
  }
}
