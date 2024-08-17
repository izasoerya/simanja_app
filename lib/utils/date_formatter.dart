import 'package:intl/intl.dart';

class DateFormatter {
  String convertToIndonesian(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MMMM-yyyy', 'id_ID');
    return formatter.format(date);
  }

  int calculateAgeInMonths(DateTime birthdate) {
    DateTime today = DateTime.now();
    int yearsDifference = today.year - birthdate.year;
    int monthsDifference = today.month - birthdate.month;

    int ageInMonths = yearsDifference * 12 + monthsDifference;
    if (today.day < birthdate.day) {
      ageInMonths--;
    }
    return ageInMonths;
  }
}
