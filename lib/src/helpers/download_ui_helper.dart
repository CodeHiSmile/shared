import 'package:shared/src/helpers/download_helper.dart';
import 'package:flutter/material.dart';

class DownloadUIHelper {
  static Future<void> downloadAndOpenFile(
    String url,
    BuildContext context,
    Function(String filePath)? onDownloadComplete,
    Function? onDownloadError,
  ) async {
    try {
      final path = await DownloadHelper.downloadFile(url: url);
      if (path == null) {
        if (!context.mounted) return;

        onDownloadError?.call();
        // AppDialogHelper.showDialogInfo(
        //   context,
        //   title: "Thất bại",
        //   message: "Không thể tải file",
        // );
        return;
      }

      if (!context.mounted) return;
      onDownloadComplete?.call(path);

      // AppDialogHelper.showDialogConfirm(
      //   context,
      //   title: "Tải thành công",
      //   message: "File đã được tải tại: $path",
      //   buttonNameConfirm: "Mở file",
      //   onConfirmAction: () => OpenFilex.open(path),
      // );
    } catch (e) {
      onDownloadError?.call();
      // AppDialogHelper.showDialogInfo(
      //   context,
      //   title: "Lỗi tải file",
      //   message: e.toString(),
      // );
    }
  }
}
