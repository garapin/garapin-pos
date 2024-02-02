import 'package:armory/engine/engine.dart';

class RangeDateTime {
  static String convert(DateTime? start, DateTime? end) {
    if (start == null || end == null) return '-';
    if (start.year == end.year) {
      if (start.month == end.month) {
        return '${start.day} - ${end.toddMMMMyyyy()}';
      } else {
        return '${start.toddMMMM()} - ${end.toddMMMMyyyy()}';
      }
    } else {
      return '${start.toddMMMMyyyy()} - ${end.toddMMMMyyyy()}';
    }
  }

  static String convertFromString(
    String? start,
    String? end, {
    String startPattern = 'dd-MM-yyyy',
    String endPattern = 'dd-MM-yyyy',
  }) {
    if (start == null || end == null) return '-';
    DateTime startDate = start.toDateTime(pattern: startPattern);
    DateTime endDate = end.toDateTime(pattern: endPattern);
    if (startDate.year == endDate.year) {
      if (startDate.month == endDate.month) {
        return '${startDate.day} - ${endDate.toddMMMMyyyy()}';
      } else {
        return '${startDate.toddMMMM()} - ${endDate.toddMMMMyyyy()}';
      }
    } else {
      return '${startDate.toddMMMMyyyy()} - ${endDate.toddMMMMyyyy()}';
    }
  }
}
