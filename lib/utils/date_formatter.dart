import 'package:intl/intl.dart';

class DateFormatter {
  String convertToIndonesian(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MMMM-yyyy', 'id_ID');
    return formatter.format(date);
  }
}
