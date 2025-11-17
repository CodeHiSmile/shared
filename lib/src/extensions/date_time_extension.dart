import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeParsing on DateTime {
  String toStringWithFormat(String format) {
    return DateFormat(format).format(this);
  }

  String getDay() => DateFormat('EEEE', 'vi').format(toLocal());

  String getShortDay() => DateFormat('E', 'vi').format(toLocal());

  String formatDateTime(String pattern) =>
      DateFormat(pattern, 'vi').format(toLocal());

  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;

  int diffSecondsFromNow() =>
      toLocal().secondsSinceEpoch - DateTime.now().secondsSinceEpoch;

  String timeRelative(Duration? maxDuration, String pattern) {
    final now = DateTime.now();
    if (maxDuration != null &&
        (add(maxDuration).isBefore(now) ||
            subtract(maxDuration).isAfter(now))) {
      return formatDateTime(pattern);
    }
    return timeago.format(this, locale: 'vi');
  }

  DateTime roundDown({Duration delta = const Duration(seconds: 15)}) {
    return DateTime.fromMillisecondsSinceEpoch(
      millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds,
    );
  }

  DateTime roundUp({Duration delta = const Duration(seconds: 15)}) {
    return DateTime.fromMillisecondsSinceEpoch(
      millisecondsSinceEpoch + millisecondsSinceEpoch % delta.inMilliseconds,
    );
  }

  DateTime get endOfMonth => month < 12
      ? DateTime(year, month + 1).subtract(const Duration(days: 1))
      : DateTime(year + 1, 1).subtract(const Duration(days: 1));

  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  DateTime addDays(int amount, [bool ignoreDaylightSavings = false]) {
    return ignoreDaylightSavings
        ? DateTime(
            year,
            month,
            day + amount,
            hour,
            minute,
            second,
            millisecond,
            microsecond,
          )
        : add(Duration(days: amount));
  }

  DateTime get nextDay => addDays(1);

  DateTime setHour(
    int hour, [
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setMonth(int month) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Start of the day (7:00 AM local time)
  DateTime get startOfDay => setHour(7, 0, 0, 0);

  /// Start of the day (midnight)
  DateTime get startDay => setHour(0, 0, 0, 0);

  /// End of the day (6:59:59.999 AM next day for shift-based time logic)
  DateTime get endOfDay => setHour(6, 59, 59, 999);

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  bool get isYesterday {
    final nowDate = DateTime.now();
    const oneDay = Duration(days: 1);
    return nowDate.subtract(oneDay).isSameDate(this);
  }
}
