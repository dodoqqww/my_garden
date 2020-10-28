import 'package:intl/intl.dart';

String dateToString(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy.MM.dd');
  return formatter.format(date);
}

DateTime stringToDate(String date) {
  final DateFormat formatter = DateFormat('yyyy.MM.dd');
  return formatter.parse(date);
}
