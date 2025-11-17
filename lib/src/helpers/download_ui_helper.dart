import 'package:shared/src/helpers/app_dialog_helper.dart';
import 'package:shared/src/helpers/download_helper.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';

class DownloadUIHelper {
  static Future<void> downloadAndOpenFile(
    String url,
    BuildContext context,
  ) async {
    try {
      final path = await DownloadHelper.downloadFile(url: url);
      if (path == null) {
        if (!context.mounted) return;

        AppDialogHelper.showDialogInfo(
          context,
          title: "Thất bại",
          message: "Không thể tải file",
        );
        return;
      }

      if (!context.mounted) return;
      AppDialogHelper.showDialogConfirm(
        context,
        title: "Tải thành công",
        message: "File đã được tải tại: $path",
        buttonNameConfirm: "Mở file",
        onConfirmAction: () => OpenFilex.open(path),
      );
    } catch (e) {
      AppDialogHelper.showDialogInfo(
        context,
        title: "Lỗi tải file",
        message: e.toString(),
      );
    }
  }
}
