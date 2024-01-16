import 'dart:developer';

import 'package:intl/intl.dart';

import '../configs/environment.dart';

extension StringExtension on String {
  String toUpperCaseFirstLetter() {
    try {
      List<String> beginNames = trim().split(" ");
      for (int x = 0; x < beginNames.length; x++) {
        String name = beginNames[x];
        List<String> names = name.split('');
        names[0] = names[0].toUpperCase();
        beginNames[x] = names.join('');
      }
      return beginNames.join(" ");
    } catch (e) {
      log('Error uppercase first letter: $e');
      return this;
    }
  }

  String firstLetterOnly() {
    try {
      List<String> beginNames = trim().split("");
      return beginNames[0].toUpperCase();
    } catch (e) {
      log('Error uppercase first letter: $e');
      return this;
    }
  }

  String currencyDot({String? symbol, String? locale}) {
    try {
      locale = locale ?? Environment.currentLanguages.languageCode;
      final f = NumberFormat.currency(
        locale: locale,
        decimalDigits: 0,
        symbol: symbol,
      );
      var num = int.parse(replaceAll(RegExp('[^0-9]'), ''));
      return f.format(num).trim();
    } catch (_) {
      return this;
    }
  }

  String deleteCurrency() => replaceAll(".", "");

  DateTime toDateTime({String pattern = 'dd-MM-yyyy'}) =>
      DateFormat(pattern).parse(this);
}
