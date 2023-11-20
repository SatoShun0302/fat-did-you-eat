import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  static setInitializeDateFormatting(String locale) {
    initializeDateFormatting(locale);
  }

  /// DateTimeを指定した形式の文字列へ変換する.
  static String getStringYearMonthDay(String dateFormat, String dateLocale) {
    var now = DateTime.now();
    var formatter = DateFormat(dateFormat, dateLocale);
    return formatter.format(now);
  }

  /// 2つのUnixTimeを比較し日数差を計算する.
  static int getDaysDifferenceFromUnixTime(int todayUnixTime, int consumedUnixTime) {
    if (todayUnixTime < consumedUnixTime) {
      return 0;
    }
    DateTime todayDateTime = DateTime.fromMillisecondsSinceEpoch(todayUnixTime);
    DateTime consumedDateTime = DateTime.fromMillisecondsSinceEpoch(consumedUnixTime);
    final difference = consumedDateTime.difference(todayDateTime);
    return difference.inDays;
  }
}
