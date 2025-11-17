import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  double plus(double other) {
    return this + other;
  }

  double minus(double other) {
    return this - other;
  }

  double times(double other) {
    return this * other;
  }

  double div(double other) {
    return this / other;
  }

  String formatCurrency({
    String symbol = 'đ',
    String locale = 'vi_VN',
    int decimalDigits = 0,
  }) {
    String currency = NumberFormat.currency(
      symbol: '',
      locale: locale,
      decimalDigits: decimalDigits,
    ).format(this);
    return '$currency$symbol';
  }
}
