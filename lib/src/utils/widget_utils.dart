import 'package:shared/src/utils/object_utils.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  /// Lấy vị trí widget trên màn hình
  static Offset? getWidgetPosition(GlobalKey globalKey) {
    return (globalKey.currentContext?.findRenderObject() as RenderBox?)?.let(
      (it) => it.localToGlobal(Offset.zero),
    );
  }

  /// Lấy chiều rộng widget
  static double? getWidgetWidth(GlobalKey globalKey) {
    return (globalKey.currentContext?.findRenderObject() as RenderBox?)?.let(
      (it) => it.size.width,
    );
  }

  /// Lấy chiều cao widget
  static double? getWidgetHeight(GlobalKey globalKey) {
    return (globalKey.currentContext?.findRenderObject() as RenderBox?)?.let(
      (it) => it.size.height,
    );
  }
}
