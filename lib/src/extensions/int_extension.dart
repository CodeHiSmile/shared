import 'package:intl/intl.dart';

extension IntExtensions on int {
  int plus(int other) {
    return this + other;
  }

  int minus(int other) {
    return this - other;
  }

  int times(int other) {
    return this * other;
  }

  double div(int other) {
    return this / other;
  }

  int truncateDiv(int other) {
    return this ~/ other;
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
