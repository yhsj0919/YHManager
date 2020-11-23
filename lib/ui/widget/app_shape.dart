import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppShape {
  AppShape._();

  static ShapeBorder circular() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(50),
    ));
  }

  static ShapeBorder rectangle({
    double tlRadius = 0,
    double trRadius = 0,
    double blRadius = 0,
    double brRadius = 0,
  }) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(tlRadius),
      topRight: Radius.circular(trRadius),
      bottomRight: Radius.circular(brRadius),
      bottomLeft: Radius.circular(blRadius),
    ));
  }
}
