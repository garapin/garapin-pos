import 'package:intl/intl.dart';

import '../configs/environment.dart';

extension IntExtensions on int {
  String currencyFormat({
    String symbol = '',
    int decimalDigit = 0,
    String? locale,
  }) {
    locale = locale ?? Environment.currentLanguages.languageCode;
    return NumberFormat.currency(
      locale: locale,
      decimalDigits: decimalDigit,
      symbol: symbol,
    ).format(this);
  }
}

extension IntNullExtension on int? {
  String currencyFormat({
    String symbol = '',
    int decimalDigit = 0,
    String? locale,
  }) {
    locale = locale ?? Environment.currentLanguages.languageCode;
    int number = this ?? 0;
    return NumberFormat.currency(
      locale: locale,
      decimalDigits: decimalDigit,
      symbol: symbol,
    ).format(number);
  }
}
