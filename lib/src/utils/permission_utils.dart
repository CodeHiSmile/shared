import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// Kiểm tra xem Android có phải là version < 33 (Android 13)
  static Future<bool> isOldAndroidVersion() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return androidInfo.version.sdkInt < 33;
    }
    return false;
  }

  /// Xin quyền truy cập storage
  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // Android 13+
        final statuses = await [
          Permission.photos,
          Permission.videos,
          Permission.audio,
        ].request();

        return statuses.values.every((s) => s.isGranted);
      } else if (sdkInt >= 30) {
        // Android 11–12
        // final status = await Permission.manageExternalStorage.request();
        final status = await Permission.storage.request();

        return status.isGranted;
      } else {
        // Android 10 trở xuống
        final status = await Permission.storage.request();
        return status.isGranted;
      }
    }
    return true;
  }

  static Future<dynamic> handleRequestPhotoPermission({
    VoidCallback? handleWhenIsGranted,
  }) async {
    bool isGranted = await Permission.photos.status.isGranted;
    bool isLimited = await Permission.photos.status.isLimited;
    if (isGranted || isLimited) {
      return;
    }
    showDialogSetting(Permission.photos);
  }

  static Future<dynamic> handleRequestCameraPermission({
    VoidCallback? handleWhenIsGranted,
  }) async {
    bool isGranted = await Permission.camera.status.isGranted;
    bool isLimited = await Permission.camera.status.isLimited;
    if (isGranted || isLimited) {
      return;
    }
    showDialogSetting(Permission.camera);
  }

  static Future<dynamic> handleRequestContactPermission({
    VoidCallback? handleWhenIsGranted,
  }) async {
    bool isGranted = await Permission.contacts.status.isGranted;
    bool isLimited = await Permission.contacts.status.isLimited;
    if (isGranted || isLimited) {
      return;
    }
    showDialogSetting(Permission.contacts);
  }

  static Future<bool> isAccessiblePermission(Permission permissionType) async {
    final bool isGranted =
        await permissionType.status.isGranted ||
        await permissionType.status.isLimited;
    if (isGranted) {
      return true;
    }
    return false;
  }

  static Future<dynamic> handleRequestPermission(
    Permission permissionType, {
    Future<dynamic> Function()? handleWhenIsGranted,
  }) async => Platform.isAndroid
      ? await handleRequestPermissionAndroid(
          permissionType,
          handleWhenIsGranted: handleWhenIsGranted,
        )
      : await handleRequestPermissionIos(
          permissionType,
          handleWhenIsGranted: handleWhenIsGranted,
        );

  static Future<dynamic> handleRequestPermissionIos(
    Permission permissionType, {
    Future<dynamic> Function()? handleWhenIsGranted,
  }) async {
    if (await PermissionUtils.isAccessiblePermission(permissionType)) {
      return handleWhenIsGranted?.call();
    }
    if (await permissionType.status.isDenied) {
      return requestPermission(
        permissionType,
        handleWhenIsGranted: handleWhenIsGranted,
      );
    }
    showDialogSetting(permissionType);
  }

  static Future<dynamic> handleRequestPermissionAndroid(
    Permission permissionType, {
    Future<dynamic> Function()? handleWhenIsGranted,
  }) async {
    if (await permissionType.status.isDenied &&
        await permissionType.shouldShowRequestRationale) {
      await showDialogSetting(permissionType);
      return;
    }
    if (await PermissionUtils.isAccessiblePermission(permissionType)) {
      return handleWhenIsGranted?.call();
    }
    bool secondRequest = await permissionType.request().isGranted;
    if (secondRequest) {
      return handleWhenIsGranted?.call();
    }
  }

  static Future showDialogSetting(Permission permissionType) async {
    //Note important: Xử lý hàm này sau khi đã có đầy đủ common

    // final navigator = GetIt.instance.get<AppNavigator>();
    //
    // navigator.showDialog(
    //   AppDialogHelper.showAlertSetting(
    //     message: "Tới cài đặt để cấp quyền cho ứng dụng",
    //     onPressed: Func0(() async {
    //       openAppSettings();
    //       navigator.pop();
    //     }),
    //   ),
    // );
  }

  static Future<dynamic> requestPermission(
    Permission permissionType, {
    Future<dynamic> Function()? handleWhenIsGranted,
  }) async {
    PermissionStatus requestStatus = await permissionType.request();
    if (requestStatus.isGranted || requestStatus.isLimited) {
      return handleWhenIsGranted?.call();
    }
  }

  static String getNamePermissionByType(Permission permission) {
    switch (permission) {
      case Permission.camera:
        return 'Camera';
      case Permission.photos:
      case Permission.storage:
        return "Hình ảnh";
      case Permission.microphone:
        return "Microphone";
      default:
        return "";
    }
  }
}
