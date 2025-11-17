import 'package:flutter/material.dart';

/// Helper class for handling keyboard visibility and focus management.
class KeyboardHelper {
  /// Ẩn bàn phím nếu đang được mở.
  static void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Kiểm tra xem bàn phím có đang hiển thị không.
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}
