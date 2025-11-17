import 'package:intl/intl.dart';

class NumberUtils {
  const NumberUtils._();

  static final _moneyFormatter = NumberFormat.currency(
    symbol: "đ",
    decimalDigits: 0,
    customPattern: "##,###,###¤",
  );

  static final _numberFormatter = NumberFormat.currency(
    symbol: "",
    decimalDigits: 0,
    customPattern: "##,###,###",
  );

  static String formatMoney(num value) {
    return _moneyFormatter.format(value);
  }

  static String displayMoney(num value) {
    return NumberFormat.currency(
      symbol: "",
      decimalDigits: 0,
      customPattern: "##,###,###¤",
    ).format(value);
  }

  static String formatNumber(num value) {
    return _numberFormatter.format(value);
  }

  static String formatDiscountMoney(int value) {
    if ((value / 1000).round() > 0) {
      return "-đ${(value / 1000).round()}K";
    }
    return "-đ$value";
  }

  static String formatFlexibleDouble(double value) {
    final number = NumberFormat("#,##0.###");
    return "${number.format(value)}đ";
  }
}
