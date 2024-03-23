import 'package:pos/themes/themes.dart';
import 'package:flutter/material.dart';

Color getColorFromString(String status) {
  switch (status) {
    case 'ACTIVE':
      return AppColor.appColor.success;
    case 'INACTIVE':
      return Colors.grey;
    case 'PENDING':
      return AppColor.appColor.warning;
    case 'DECLINE':
      return Colors.red;
    default:
      return Colors.black;
  }
}
