import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static shareLink({
    BuildContext? context,
    required String urlShare,
    Function? onShareSuccess,
  }) async {
    if (urlShare.isEmpty) {
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không có đường dẫn để chia sẻ')),
        );
      }
      return;
    }

    final result = await SharePlus.instance.share(
      ShareParams(uri: Uri.parse(urlShare)),
    );

    if (result.status == ShareResultStatus.success) {
      onShareSuccess?.call();
    }
  }
}
