import 'dart:async';

import 'package:shared/src/config/log_config.dart';
import 'package:shared/src/mixin/log_mixin.dart';
import 'package:shared/src/utils/log_utils.dart';
import 'package:shared/src/utils/stream/disposable.dart';
import 'package:flutter/material.dart';

///Quản lý và thu gom các tài nguyên cần được giải phóng (dispose) trong một nơi tập trung
class DisposeBag with LogMixin {
  static const _enableLogging = LogConfig.enableDisposeBagLog;
  final List<Object> _disposable = [];

  void addDisposable(Object disposable) {
    _disposable.add(disposable);
  }

  void dispose() {
    for (var disposable in _disposable) {
      if (disposable is StreamSubscription) {
        disposable.cancel();
        if (_enableLogging) {
          LogUtils.d('Canceled $disposable');
        }
      } else if (disposable is StreamController) {
        disposable.close();
        if (_enableLogging) {
          LogUtils.d('Closed $disposable');
        }
      } else if (disposable is ChangeNotifier) {
        disposable.dispose();
        if (_enableLogging) {
          LogUtils.d('Disposed $disposable');
        }
      } else if (disposable is Disposable) {
        disposable.dispose();
      }
    }

    _disposable.clear();
  }
}

extension StreamSubscriptionExtensions<T> on StreamSubscription<T> {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension StreamControllerExtensions<T> on StreamController<T> {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension ChangeNotifierExtensions on ChangeNotifier {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension DisposableExtensions on Disposable {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}
