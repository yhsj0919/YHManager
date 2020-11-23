import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Map Json扩展方法
extension WidgetExtension on Widget {
  Widget isMobile({Widget def}) {
    if (GetPlatform.isMobile) {
      return def ?? Container();
    } else {
      return this;
    }
  }
}

extension IntExtension on num {
  num isMobile({num def}) {
    if (GetPlatform.isMobile) {
      return def ?? 0;
    } else {
      return this;
    }
  }
}
