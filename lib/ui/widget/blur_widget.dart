import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlurWidget extends StatelessWidget {
  Widget child;
  double padding;
  double margin;
  double width;
  double height;
  double radius;
  Color color;
  double elevation;
  Alignment alignment;
  double blur;
  Color shadowColor;
  ShapeBorder shape;
  GestureTapCallback onTap;

  BlurWidget(
      {this.child,
      this.width,
      this.blur: 20,
      this.height,
      this.margin: 0,
      this.padding: 0,
      this.elevation: 4,
      this.shadowColor,
      this.radius: 0,
      this.alignment,
      this.shape,
      this.color: Colors.white38,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:shape ,

          boxShadow: [
        BoxShadow(
            color: shadowColor ?? Colors.black12,
            offset: Offset(0.0, elevation), //阴影xy轴偏移量
            blurRadius: elevation * 2, //阴影模糊程度
            spreadRadius: elevation //阴影扩散程度
            )
      ]),
      margin: EdgeInsets.all(margin),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              alignment: alignment,
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
