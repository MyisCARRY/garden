import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

abstract class DateFormats {
  static String fullDate(DateTime date) {
    initializeDateFormatting();
    final DateFormat format = DateFormat('dd-MM-yyyy');
    return format.format(date);
  }
}
