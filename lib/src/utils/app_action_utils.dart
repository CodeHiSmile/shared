import 'package:flutter/services.dart' as service;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActionUtils {
  const ActionUtils._();

  static Future<void> copyToClipboard(String content) async {
    await service.Clipboard.setData(service.ClipboardData(text: content));

    Fluttertoast.showToast(
      msg: "Đã sao chép",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<void> callPhoneNumber(String phoneNumber) async {
    await launchUrlString("tel://$phoneNumber");
  }
}
