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
    final formatter = NumberFormat.currency(
      symbol: '',
      locale: locale,
      decimalDigits: decimalDigits,
    );

    final currency = formatter.format(this).trim();

    return '$currency$symbol';
  }

  String formatVND() {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: 'VNĐ ',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }

  String formatCount() {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    }
    return '$this';
  }

  String formatCountDouble() {
    if (this >= 1000000) {
      return '${_formatCompact(this / 1000000)}M';
    } else if (this >= 100000) {
      return '${_formatCompact(this / 1000)}K';
    } else {
      final formatter = NumberFormat('#,###', 'en_US');
      return formatter.format(this);
    }
  }

  String _formatCompact(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }
}