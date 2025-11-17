import 'package:shared/src/utils/log_utils.dart';

enum Flavor { develop, qa, staging, production }

class EnvConstants {
  const EnvConstants._();

  static const flavorKey = 'FLAVOR';
  static const appBasicAuthNameKey = 'APP_BASIC_AUTH_NAME';
  static const appBasicAuthPasswordKey = 'APP_BASIC_AUTH_PASSWORD';

  static Flavor flavor = Flavor.values.byName(
    const String.fromEnvironment(flavorKey, defaultValue: 'develop'),
  );

  static String appBasicAuthName = const String.fromEnvironment(
    appBasicAuthNameKey,
  );

  static String appBasicAuthPassword = const String.fromEnvironment(
    appBasicAuthPasswordKey,
  );

  //Note important: Call this method in the main.dart method to log the environment variables
  static void init() {
    LogUtils.d(flavor, tag: flavorKey);
    LogUtils.d(appBasicAuthName, tag: appBasicAuthNameKey);
    LogUtils.d(appBasicAuthPassword, tag: appBasicAuthPasswordKey);
  }
}
