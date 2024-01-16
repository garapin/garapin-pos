import 'package:intl/intl.dart';
import '../configs/environment.dart';

extension DateTimeExtensions on DateTime {
  String format({String pattern = 'yyyy-MM-dd HH:mm:ss', String? locale}) {
    String loc = locale ?? Environment.currentLanguages.languageCode;
    try {
      return DateFormat(pattern, loc).format(this);
    } catch (e) {
      return toString();
    }
  }

  String toddMMMMyyyy({String? locale}) =>
      format(pattern: 'dd MMMM yyyy', locale: locale);

  String toddMMMM({String? locale}) =>
      format(pattern: 'dd MMMM', locale: locale);

  String toddMMMyyyy({String? locale}) =>
      format(pattern: 'dd MMM yyyy', locale: locale);

  String toEEEEddMMMMyyyy({String? locale}) =>
      format(pattern: 'EEEE, dd MMMM yyyy', locale: locale);

  String toEEEddMMMMyyyy({String? locale}) =>
      format(pattern: 'EEE, dd MMMM yyyy', locale: locale);

  String toyyyyMMdd({String? locale}) =>
      format(pattern: 'yyyy-MM-dd', locale: locale);

  String toHHmm({String? locale}) => format(pattern: 'HH:mm', locale: locale);

  String toHHmmss({String? locale}) =>
      format(pattern: 'HH:mm:ss', locale: locale);

  String toddMMMyyyyHHmm({String? locale}) =>
      format(pattern: 'dd MMM yyyy, HH:mm', locale: locale);

  String toddMMMyyyyHHmmss({String? locale}) =>
      format(pattern: 'dd MMM yyyy, HH:mm:ss', locale: locale);
}
