class DateTimeFormatter {
  /// 🗓️ Dành cho hiển thị người dùng (UI)
  static const String formatDateVi = "dd/MM/yyyy";
  static const String formatDateTimeVi = "dd/MM/yyyy HH:mm:ss";
  static const String formatDateTimeView = "dd/MM/yyyy HH:mm";
  static const String formatOnlyDay = "dd";
  static const String formatMonthFull = "MMMM";
  static const String formatWeekdayFullVi = "EEEE";
  static const String formatWeekdayShortVi = "EEE";
  static const String formatFullDayVi = "EEEE, dd/MM/yyyy";
  static const String formatHourMinute = "HH:mm";
  static const String formatDayMonth = "dd/MM";
  static const String formatMonthYear = "MM/yyyy";
  static const String formatDateAndHourVi = "dd/MM/yyyy, HH:mm";

  /// 🌐 Dành cho xử lý dữ liệu server / backend
  static const String formatServerDate = "yyyy-MM-dd";
  static const String formatServerDateTime = "yyyy-MM-dd HH:mm:ss";
  static const String formatFullISOWithZone = "yyyy-MM-dd'T'hh:mm:ss.SSSZ";
  static const String formatFullISO = "yyyy-MM-dd'T'hh:mm:ss.SSS";
  static const String formatFullISOZ = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const String formatISOSecond = "yyyy-MM-dd'T'HH:mm:ss'";
}
