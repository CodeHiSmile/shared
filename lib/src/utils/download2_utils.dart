import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shared/src/helpers/app_dialog_helper.dart';
import 'package:shared/src/utils/log_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

class Download2Utils {
  //Class này đã được kiểm định về luồng, còn DownloadHelper là class mới dựng lại chưa được kiểm chứng
  //Test lại 2 class này sau khi hoàn thành xong DownloadHelper
  static void downloadFile({
    String? url,
    String? name,
    Function? onDownloading,
    Function(double)? onReceiveProgress,
    Function? onFailureCallBack,
    Function(String path)? onSuccessCallBack,
  }) async {
    final checkVersionLess33 = await checkOldAndroidVersion();

    if (checkVersionLess33) {
      PermissionStatus? permissionFile;

      permissionFile = await Permission.storage.status;

      if (permissionFile != PermissionStatus.denied) {
        if (permissionFile == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        } else {
          handleDownLoadDocument(
            url ?? '',
            name ?? '',
            onDownloading: onDownloading,
            onFailureCallBack: onFailureCallBack,
            onReceiveProgress: onReceiveProgress,
            onSuccessCallBack: onSuccessCallBack,
          );
        }
      } else {
        final result = await Permission.storage.request();
        if (result != PermissionStatus.denied) {
          if (result == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          } else {
            handleDownLoadDocument(
              url ?? '',
              name ?? '',
              onDownloading: onDownloading,
              onFailureCallBack: onFailureCallBack,
              onReceiveProgress: onReceiveProgress,
              onSuccessCallBack: onSuccessCallBack,
            );
          }
        }
        permissionFile = await Permission.storage.status;
      }
    } else {
      handleDownLoadDocument(
        url ?? '',
        name ?? '',
        onDownloading: onDownloading,
        onFailureCallBack: onFailureCallBack,
        onReceiveProgress: onReceiveProgress,
        onSuccessCallBack: onSuccessCallBack,
      );
    }
  }

  static void downloadFileBase64({
    required Uint8List base64Str,
    String? name,
    Function? onFailureCallBack,
    Function(String path)? onSuccessCallBack,
  }) async {
    final checkVersionLess33 = await checkOldAndroidVersion();

    if (checkVersionLess33) {
      PermissionStatus? permissionFile;
      permissionFile = await Permission.storage.status;
      if (permissionFile != PermissionStatus.denied) {
        if (permissionFile == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        } else {
          downLoadFileBase64(
            base64Str: base64Str,
            fileName: name ?? '',
            onFailureCallBack: onFailureCallBack,
            onSuccessCallBack: onSuccessCallBack,
          );
        }
      } else {
        final result = await Permission.storage.request();
        if (result != PermissionStatus.denied) {
          if (result == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          } else {
            downLoadFileBase64(
              base64Str: base64Str,
              fileName: name ?? '',
              onFailureCallBack: onFailureCallBack,
              onSuccessCallBack: onSuccessCallBack,
            );
          }
        }
      }
    } else {
      downLoadFileBase64(
        base64Str: base64Str,
        fileName: name ?? '',
        onFailureCallBack: onFailureCallBack,
        onSuccessCallBack: onSuccessCallBack,
      );
    }
  }

  static void handleDownLoadDocument(
    String url,
    String name, {
    Function? onDownloading,
    Function(double)? onReceiveProgress,
    Function? onFailureCallBack,
    Function(String path)? onSuccessCallBack,
  }) async {
    String? dir = await getDownloadPath();
    if (dir != null) {
      String savePath = "$dir/$name";
      try {
        onDownloading?.call();
        await Dio().download(
          url,
          savePath,
          onReceiveProgress: (progress, total) =>
              onReceiveProgress?.call(progress / total * 100),
        );
        onSuccessCallBack?.call(savePath);
      } catch (e) {
        onFailureCallBack?.call();
      }
    }
  }

  static void downLoadFileBase64({
    required Uint8List base64Str,
    required String fileName,
    Function? onFailureCallBack,
    Function(String path)? onSuccessCallBack,
  }) async {
    try {
      final directory = await getTemporaryDirectory();
      final path = directory.path;

      final file = File('$path/$fileName');
      if (await file.exists()) {
        final uint8lst = base64Encode(base64Str);
        final bytes = base64.decode(uint8lst);
        await file.writeAsBytes(bytes);
      } else {
        file.createSync();
        final uint8lst = base64Encode(base64Str);
        final bytes = base64.decode(uint8lst);
        await file.writeAsBytes(bytes);
      }
      onSuccessCallBack?.call(file.path);
    } catch (e) {
      onFailureCallBack?.call();
    }
  }

  static Future<String?> getDownloadPath() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getTemporaryDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
    return directory?.path;
  }

  static void saveImage({
    Uint8List? imageBytes,
    String? url,
    Function? onSaving,
    Function? onFailureCallBack,
    Function? onDone,
  }) async {
    final checkVersionLess33 = await checkOldAndroidVersion();

    if (checkVersionLess33) {
      PermissionStatus? permissionFile = await Permission.storage.status;

      if (permissionFile != PermissionStatus.denied) {
        if (permissionFile == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        } else {
          handleSaveImage(
            imageBytes: imageBytes,
            url: url,
            onSaving: onSaving,
            onFailureCallBack: onFailureCallBack,
            onDone: onDone,
          );
        }
      } else {
        final result = await Permission.storage.request();
        if (result != PermissionStatus.denied) {
          if (result == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          } else {
            handleSaveImage(
              imageBytes: imageBytes,
              url: url,
              onSaving: onSaving,
              onFailureCallBack: onFailureCallBack,
              onDone: onDone,
            );
          }
        }
        permissionFile = await Permission.storage.status;
      }
    } else {
      handleSaveImage(
        imageBytes: imageBytes,
        url: url,
        onSaving: onSaving,
        onFailureCallBack: onFailureCallBack,
        onDone: onDone,
      );
    }
  }

  static void handleSaveImage({
    Uint8List? imageBytes,
    String? url,
    String? imageName,
    Function? onSaving,
    Function? onFailureCallBack,
    Function? onDone,
  }) async {
    onSaving?.call();

    if (imageBytes != null) {
      SaverGallery.saveImage(
        imageBytes,
        fileName: imageName ?? 'qr.png',
        skipIfExists: true,
      ).then(
        (value) => value.isSuccess ? onDone?.call() : onFailureCallBack?.call(),
      );
    } else if ((url ?? '').isNotEmpty) {
      final directory = await getTemporaryDirectory();
      final path = directory.path;
      final savePath = '$path/${imageName ?? url!.split('/').last}';

      LogUtils.d("Save path: $savePath");
      Dio dio = Dio();
      await dio.download(
        url!,
        savePath,
        options: Options(headers: {'Accept-Encoding': "*"}),
      );

      SaverGallery.saveFile(
        filePath: savePath,
        fileName: imageName ?? url.split('/').last,
        skipIfExists: true,
        androidRelativePath: "Pictures",
      ).then(
        (value) => value.isSuccess ? onDone?.call() : onFailureCallBack?.call(),
      );
    }
  }

  static Future<bool> checkOldAndroidVersion() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      if (sdkInt >= 33) {
        return false;
      }
    }
    return true;
  }

  static Future<void> downloadUrl(
    BuildContext context, {
    required String url,
    String? customFolder,
  }) async {
    try {
      if (Platform.isAndroid) {
        if (await _requestPermissions() == false) {
          LogUtils.d('Không có quyền truy cập storage');
          return;
        }
      }

      final dir = await _getDownloadDirectory(customFolder);

      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      final fileName = _getFileNameFromUrl(url);
      final filePath = '${dir.path}/$fileName';

      final file = File(filePath);
      if (await file.exists()) {
        final newFileName = _generateUniqueFileName(fileName, dir.path);
        final newFilePath = '${dir.path}/$newFileName';

        LogUtils.d('File đã tồn tại, lưu với tên mới: $newFileName');
        await _downloadFile(url, newFilePath);
        if (!context.mounted) return;
        AppDialogHelper.showDialogConfirm(
          context,
          title: "Tải thành công",
          message: 'File đã được tải xuống thành công tại: $filePath',
          buttonNameConfirm: "Mở file",
          onConfirmAction: () async {
            await OpenFilex.open(filePath);
          },
        );
      } else {
        await _downloadFile(url, filePath);
        await OpenFilex.open(filePath);
      }
    } catch (e) {
      LogUtils.d('Lỗi khi tải file: $e');
      rethrow;
    }
  }

  static Future<bool> _requestPermissions() async {
    // Kiểm tra phiên bản Android
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      // Android 13+
      // Yêu cầu quyền mới cho Android 13+
      Map<Permission, PermissionStatus> statuses = await [
        Permission.photos,
        Permission.videos,
        Permission.audio,
      ].request();

      return statuses.values.every((status) => status.isGranted);
    } else if (sdkInt >= 30) {
      // Android 11-12
      // Sử dụng quyền quản lý tất cả file cho Android 11-12
      if (await Permission.manageExternalStorage.isGranted) {
        return true;
      }
      final status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    } else {
      // Android 10 trở xuống
      // Sử dụng quyền storage truyền thống
      if (await Permission.storage.isGranted) {
        return true;
      }
      final status = await Permission.storage.request();
      return status.isGranted;
    }
  }

  static Future<Directory> _getDownloadDirectory(String? customFolder) async {
    if (Platform.isAndroid) {
      Directory? downloadsDir;

      // Kiểm tra phiên bản Android
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // Android 13+
        // Sử dụng thư mục ứng dụng riêng cho Android 13+
        downloadsDir = await getApplicationDocumentsDirectory();
      } else {
        // Sử dụng thư mục bên ngoài cho các phiên bản cũ hơn
        downloadsDir = await getExternalStorageDirectory();
      }

      if (customFolder != null) {
        return Directory('${downloadsDir!.path}/$customFolder');
      }
      return Directory('${downloadsDir!.path}/Downloads');
    } else if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      if (customFolder != null) {
        return Directory('${dir.path}/$customFolder');
      }
      return dir;
    } else {
      final dir =
          await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
      if (customFolder != null) {
        return Directory('${dir.path}/$customFolder');
      }
      return dir;
    }
  }

  static String _getFileNameFromUrl(String url) {
    final uri = Uri.parse(url);
    String fileName = uri.pathSegments.last;

    if (!fileName.contains('.')) {
      fileName += '.tmp';
    }

    return fileName;
  }

  static String _generateUniqueFileName(String originalName, String dirPath) {
    final parts = originalName.split('.');
    final name = parts.sublist(0, parts.length - 1).join('.');
    final extension = parts.last;

    int counter = 1;
    String newName;

    do {
      newName = '${name}_$counter.$extension';
      counter++;
    } while (File('$dirPath/$newName').existsSync());

    return newName;
  }

  static Future<void> _downloadFile(String url, String filePath) async {
    final dio = Dio();

    await dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          final progress = (received / total * 100).toStringAsFixed(1);
          LogUtils.d('Đang tải: $progress%');
        }
      },
    );

    LogUtils.d('Tải thành công tại: $filePath');
  }

  static Future<void> downloadWithOptions(
    BuildContext context, {
    required String url,
    String? fileName,
    String? folderName,
    bool openAfterDownload = true,
    Function(double)? onProgress,
  }) async {
    try {
      if (Platform.isAndroid) {
        if (await _requestPermissions() == false) {
          LogUtils.d('Không có quyền truy cập storage');
          return;
        }
      }

      final dir = await _getDownloadDirectory(folderName);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      final finalFileName = fileName ?? _getFileNameFromUrl(url);
      final filePath = '${dir.path}/$finalFileName';

      final dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            onProgress?.call(progress);
          }
        },
      );

      if (openAfterDownload) {
        if (!context.mounted) return;

        AppDialogHelper.showDialogConfirm(
          context,
          title: "Tải thành công",
          message: 'File đã được tải xuống thành công tại: $filePath',
          buttonNameConfirm: "Mở file",
          onConfirmAction: () async {
            await OpenFilex.open(filePath);
          },
        );
      } else {
        if (!context.mounted) return;

        AppDialogHelper.showDialogInfo(
          context,
          title: "Tải thành công",
          message: 'File đã được tải xuống thành công tại: $filePath',
          buttonNameConfirm: "Mở file",
        );
      }
    } catch (e) {
      LogUtils.d('Lỗi download: $e');
      rethrow;
    }
  }
}
