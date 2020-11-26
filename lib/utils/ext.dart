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

  Widget showBy(bool show) {
    if (show) {
      return this;
    } else {
      return Container();
    }
  }

  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
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
