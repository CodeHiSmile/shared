import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:shared/src/constants/ui/device_constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';

enum DeviceType { mobile, tablet, web }

class DeviceUtils {
  const DeviceUtils._();

  static DeviceType deviceType = _getDeviceType();

  static Future<String> getDeviceId() async {
    if (Platform.isIOS) {
      return await FlutterUdid.udid; // unique ID on iOS
    } else if (Platform.isAndroid) {
      const androidIdPlugin = AndroidId();
      final androidID = await androidIdPlugin.getId();
      return androidID ?? ''; // unique ID on Android
    } else {
      return "Unknown platform";
    }
  }

  static Future<DeviceInfoEntity?> getDeviceInfo() async {
    var deviceInfo = DeviceInfoPlugin();
    String deviceId = await FlutterUdid.udid;

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return DeviceInfoEntity(
        deviceId: deviceId,
        deviceName: iosDeviceInfo.name,
        manufacturer: iosDeviceInfo.localizedModel,
        deviceSystemVersion: iosDeviceInfo.systemVersion,
        platform: "IOS",
      );
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return DeviceInfoEntity(
        deviceId: deviceId,
        deviceName: androidDeviceInfo.model,
        manufacturer: androidDeviceInfo.manufacturer,
        deviceSystemVersion: androidDeviceInfo.id,
        platform: "ANDROID",
      );
    }
    return null;
  }

  static Future<String> getDeviceModelName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return iosInfo.name;
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      return '${androidInfo.brand} ${androidInfo.device}';
    }
  }

  static DeviceType _getDeviceType() {
    final size = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    ).size;

    final shortestSide = size.shortestSide;

    if (shortestSide <= DeviceConstants.maxMobileWidth) {
      return DeviceType.mobile;
    } else if (shortestSide <= DeviceConstants.maxTabletWidth) {
      return DeviceType.tablet;
    } else {
      return DeviceType.web;
    }
  }

  static Future<String?> getLocalIp() async {
    final listNetwork = await NetworkInterface.list();
    for (var interface in listNetwork) {
      for (var address in interface.addresses) {
        if (address.type == InternetAddressType.IPv4) {
          return address.address;
        }
      }
    }
    return null;
  }
}

class DeviceInfoEntity {
  String? deviceId;
  String? deviceName;

  String? platform;

  String? manufacturer;
  String? deviceSystemVersion;

  DeviceInfoEntity({
    this.deviceId,
    this.deviceName,
    this.platform,
    this.manufacturer,
    this.deviceSystemVersion,
  });
}
