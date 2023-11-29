import 'package:intl/intl.dart';

class DateToStringConverter {
  static String dateToUSFormat(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  static String dateToMonthNameFormat(DateTime date) {
    String formattedDate = DateFormat("MMMM dd, yyyy").format(date);
    return formattedDate;
  }
}
