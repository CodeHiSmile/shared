import 'package:shared/src/utils/log_utils.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@LazySingleton()
class AppInfo {
  PackageInfo? _packageInfo;

  String get appName => _packageInfo?.appName ?? '';

  String get applicationId => _packageInfo?.packageName ?? '';

  String get versionCode => _packageInfo?.buildNumber ?? '';

  String get versionName => _packageInfo?.version ?? '';

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    LogUtils.d(_packageInfo!.packageName, tag: 'APPLICATION_ID');
    LogUtils.d(_packageInfo!.appName, tag: 'APP_NAME');
    LogUtils.d(_packageInfo!.version, tag: 'VERSION_NAME');
    LogUtils.d(_packageInfo!.buildNumber, tag: 'VERSION_CODE');
  }
}
