import 'package:intl/intl.dart';

class DateToStringConverter {
  static String convertDateToString(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }
}
