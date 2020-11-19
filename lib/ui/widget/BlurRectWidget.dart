import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlurRectWidget extends StatelessWidget {
  Widget child;
  double padding = 10;
  double margin = 10;
  double width;
  double height;
  double radius;
  Color color;
  GestureTapCallback onTap;

  BlurRectWidget({this.child, this.width, this.height, this.margin: 10, this.padding: 10, this.radius: 10, this.color: Colors.white54, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height,
              color: color,
              padding: EdgeInsets.all(padding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
