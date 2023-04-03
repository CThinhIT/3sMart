import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString({String type = "dd/MM/yyyy"}) {
    return DateFormat(type).format(this);
  }
}
