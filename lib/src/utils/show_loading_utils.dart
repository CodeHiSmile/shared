import 'package:shared/src/components/loading_indicator.dart';
import 'package:flutter/material.dart';

class ShowLoadingUtils {
  ShowLoadingUtils._privateConstructor();

  static final ShowLoadingUtils instance =
      ShowLoadingUtils._privateConstructor();

  OverlayEntry? _overlayEntry;
  Color? _valueColor;

  void setValueColor(Color? color) {
    _valueColor = color;
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2 - 25,
        left: 0,
        right: 0,
        child: Container(
          height: 50,
          width: 50,
          color: Colors.transparent,
          child: Center(
            child: LoadingIndicator(
              valueColor: _valueColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void turnOn(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void turnOff() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
  }
}
