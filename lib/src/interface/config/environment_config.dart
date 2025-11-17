import 'package:alice/alice.dart';

enum Environment { development, staging, production }

abstract class EnvironmentConfig {
  String getBaseUrl();

  String getBaseGraphqlUrl();

  String getClientId();

  void setFirebaseToken(String token);

  String getFirebaseToken();

  String getHostWebView();

  Alice? getAlice();

  void setAlice(Alice? alice);

  Environment getEnvironment();
}
