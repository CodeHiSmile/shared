import 'package:shared/src/utils/log_utils.dart';

mixin LogMixin on Object {
  void logD(String message, {DateTime? time}) {
    LogUtils.d(message, tag: runtimeType.toString());
  }

  void logE(
    Object? errorMessage, {
    Object? clazz,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    LogUtils.e(
      errorMessage,
      tag: runtimeType.toString(),
      stackTrace: stackTrace,
    );
  }
}
