import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static shareLink(
    BuildContext context, {
    required String urlShare,
    Function? onShareSuccess,
    Function? onShareFail,
  }) async {
    if (urlShare.isEmpty) {
      onShareFail?.call();
      return;
    }

    try {
      final box = context.findRenderObject() as RenderBox;

      final result = await SharePlus.instance.share(
        ShareParams(
          text: urlShare,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        ),
      );

      if (result.status == ShareResultStatus.success) {
        onShareSuccess?.call();
      }
    } catch (e, s) {
      debugPrint('Share failed: $e');
      debugPrintStack(stackTrace: s);
    }
  }
}
