import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class FormatUtils {

  static String formatDate(String dateStr) {
    initializeDateFormatting("fr_FR",null);
    return new DateFormat.yMMMd(dateStr).toString();
  }

}