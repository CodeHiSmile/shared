import 'dart:convert';
import 'dart:developer' as dev;

import 'package:shared/src/config/log_config.dart';
import 'package:logging/logging.dart';

class LogUtils {
  const LogUtils._();

  // ignore: constant_identifier_names
  static const String _TAG = 'LOG';

  static void i(
    dynamic message, {
    String tag = _TAG,
    StackTrace? stackTrace,
    String? name,
    DateTime? time,
  }) {
    _printLog(message, '$tag ❕', stackTrace, level: Level.CONFIG);
  }

  static void d(dynamic message, {String tag = _TAG, StackTrace? stackTrace}) {
    _printLog(message, '$tag 📣', stackTrace, level: Level.INFO);
  }

  static void w(dynamic message, {String tag = _TAG, StackTrace? stackTrace}) {
    _printLog(message, '$tag ⚠️', stackTrace, level: Level.WARNING);
  }

  static void e(
    dynamic message, {
    String tag = _TAG,
    StackTrace? stackTrace,
    bool withStackTrace = true,
  }) {
    _printLog(
      message,
      '$tag ❌',
      stackTrace,
      isError: true,
      level: Level.SEVERE,
      withStackTrace: withStackTrace,
    );
  }

  static void json(
    dynamic message, {
    String tag = _TAG,
    StackTrace? stackTrace,
  }) {
    _printLog(message, '$tag 💠', stackTrace);
  }

  static String prettyJson(Map<String, dynamic> json) {
    if (!LogConfig.isPrettyJson) {
      return json.toString();
    }

    final indent = '  ' * 2;
    final encoder = JsonEncoder.withIndent(indent);

    return encoder.convert(json);
  }

  static void _printLog(
    dynamic message,
    String? tag,
    StackTrace? stackTrace, {
    bool isError = false,
    Level level = Level.ALL,
    bool withStackTrace = true,
  }) {
    if (isError) {
      dev.log(
        '${DateTime.now().millisecondsSinceEpoch} - An error occurred.',
        time: DateTime.now(),
        name: tag ?? _TAG,
        level: level.value,
        error: message,
        stackTrace:
            stackTrace ??
            (isError && withStackTrace ? StackTrace.current : null),
      );
    } else {
      dev.log(
        '${DateTime.now().millisecondsSinceEpoch} - $message',
        time: DateTime.now(),
        name: tag ?? _TAG,
        level: level.value,
        stackTrace:
            stackTrace ??
            (isError && withStackTrace ? StackTrace.current : null),
      );
    }
  }
}
