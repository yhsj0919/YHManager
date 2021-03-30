import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Map Json扩展方法
extension WidgetExtension on Widget {
  Widget icon(Widget icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon ?? Container(), Container(width: 8), this],
    );
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

  Widget keyListener({ValueChanged<RawKeyEvent> onkey}) {
    return RawKeyboardListener(
      focusNode: FocusNode(canRequestFocus: false),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.select) {
            // print('>>>>>>>>>点击了确定>>>>>>>>>');
          } else {
            // print('>>>>>>>>>点击了>>${event.logicalKey}>>>>>>>');
          }

          onkey?.call(event);
        }
      },
      child: this,
    );
  }
}

extension TExt on Object {
  T isMobile<T>({@required T def}) {
    if (Get.context.isPhone) {
      return def;
    } else {
      return this;
    }
  }

  T autoValue<T>({@required bool condition, @required T def}) {
    if (condition) {
      return def;
    } else {
      return this;
    }
  }
}
