import 'package:shared/src/constants/format/date_time_formater.dart';
import 'package:shared/src/constants/locale_constants.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  const DateTimeUtils._();

  static List<DateTime> getDaysInMonth({required DateTime dateTime}) {
    List<DateTime> dateTimeCheck = [];
    List<DateTime> dateTimeFinal = [];

    for (int i = 0; i < 37; i++) {
      final tempTime = dateTime.add(Duration(days: i));
      dateTimeCheck.add(DateTime(tempTime.year, tempTime.month, tempTime.day));
    }

    for (int i = 0; i < 37; i++) {
      if (dateTimeCheck[i].month == dateTime.month) {
        dateTimeFinal.add(dateTimeCheck[i]);
      }
    }

    return dateTimeFinal;
  }

  static String getWeekdayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'T2';
      case 2:
        return 'T3';
      case 3:
        return 'T4';
      case 4:
        return 'T5';
      case 5:
        return 'T6';
      case 6:
        return 'T7';
      case 7:
        return 'CN';
      default:
        return '';
    }
  }

  static String formatDateTimeRange(String startTime, String endTime) {
    final DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    final DateFormat outputDateFormat = DateFormat(
      DateTimeFormatter.formatDateVi,
    );
    final DateFormat outputTimeFormat = DateFormat("HH:mm");

    final DateTime startDateTime = inputFormat.parse(startTime);
    final DateTime endDateTime = inputFormat.parse(endTime);

    final String formattedDate = outputDateFormat.format(startDateTime);
    final String formattedStartTime = outputTimeFormat.format(startDateTime);
    final String formattedEndTime = outputTimeFormat.format(endDateTime);

    return "$formattedDate, $formattedStartTime - $formattedEndTime";
  }

  static DateTime parseDate(String? value, String format) {
    if (value == null) return DateTime.now();
    return DateFormat(format).parse(value);
  }

  static String formatDate(DateTime value, String format) {
    return DateFormat(format).format(value);
  }

  static String formatDateWithJms(DateTime value, String format) {
    return DateFormat(format).add_jms().format(value);
  }

  static String formatDateWithUTC(DateTime value, String format) {
    return DateFormat(format).format(value.toLocal());
  }

  static String getNameOfDay(DateTime value) {
    final today = DateTime.now();
    final difference = DateTime(
      today.year,
      today.month,
      today.day,
    ).difference(DateTime(value.year, value.month, value.day)).inDays;
    if (difference == 0) return "Hôm nay";
    if (difference == 1) return "Hôm qua";
    if (difference == -1) return "Ngày mai";
    return DateFormat.yMEd().add_jms().format(value);
  }

  static String dateStringWithDay({
    required String date,
    required String oldFormat,
    String newFormat = 'yyyy-MM-dd',
  }) {
    if (date.isEmpty) return "";
    final input = DateFormat(oldFormat);
    return DateFormat(
      newFormat,
      LocaleConstants.defaultLocale,
    ).format(input.parse(date));
  }

  static String dateToString({
    required String timestamp,
    String format = "dd/MM/yyyy HH:mm",
  }) {
    final dateTime = DateTime.parse(timestamp);
    return DateFormat(format).format(dateTime);
  }

  /// return true if given year is an leap year
  static bool leapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  /// returns number of days in given month
  static int daysInMonth(int monthNum, int year) {
    List<int> monthLength = List.filled(12, 0);

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year)) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  /// return current time in milliseconds
  static int currentMillisecondsTimeStamp() =>
      DateTime.now().millisecondsSinceEpoch;

  /// return current timestamp
  static int currentTimeStamp() {
    return (DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt();
  }

  static DateTime toUtcFromTimestamp(int localTimestampMillis) {
    return DateTime.fromMillisecondsSinceEpoch(
      localTimestampMillis,
      isUtc: false,
    ).toUtc();
  }

  static DateTime? tryParse({
    String? date,
    String? format,
    String locale = LocaleConstants.defaultLocale,
  }) {
    if (date == null) {
      return null;
    }

    if (format == null) {
      return DateTime.tryParse(date);
    }

    final DateFormat dateFormat = DateFormat(format, locale);
    try {
      return dateFormat.parse(date);
    } catch (e) {
      return null;
    }
  }
}
