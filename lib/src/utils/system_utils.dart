import 'package:flutter/services.dart';

class SystemUtils {
  /// Giới hạn hướng xoay màn hình
  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  /// Cấu hình màu thanh status bar và navigation bar
  static void setSystemUIOverlayStyle(
    SystemUiOverlayStyle systemUiOverlayStyle,
  ) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
