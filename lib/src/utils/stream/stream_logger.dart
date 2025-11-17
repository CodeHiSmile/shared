import 'package:shared/src/config/log_config.dart';
import 'package:shared/src/utils/log_utils.dart';
import 'package:rxdart/rxdart.dart';

extension StreamExt<T> on Stream<T> {
  Stream<T> log(
    String name, {
    bool logOnListen = false,
    bool logOnData = false,
    bool logOnError = false,
    bool logOnDone = false,
    bool logOnCancel = false,
  }) {
    return doOnListen(() {
          if (LogConfig.logOnStreamListen && logOnListen) {
            LogUtils.d('▶️ onSubscribed', tag: name);
          }
        })
        .doOnData((event) {
          if (LogConfig.logOnStreamData && logOnData) {
            LogUtils.d('🟢 onEvent: $event', tag: name);
          }
        })
        .doOnCancel(() {
          if (LogConfig.logOnStreamCancel && logOnCancel) {
            LogUtils.d('🟡 onCanceled', tag: name);
          }
        })
        .doOnError((e, _) {
          if (LogConfig.logOnStreamError && logOnError) {
            LogUtils.e('🔴 onError $e', tag: name);
          }
        })
        .doOnDone(() {
          if (LogConfig.logOnStreamDone && logOnDone) {
            LogUtils.d('☑️️ onCompleted', tag: name);
          }
        });
  }
}
