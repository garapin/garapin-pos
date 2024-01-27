import 'package:abditrack_inventory/themes/themes.dart';
import 'package:flutter/material.dart';

Color statusTransactionColor(String status) {
  switch (status) {
    case "REQUEST":
      return Colors.blue;
    case "PROCESS":
      return Colors.orange;
    case "SUCCESS":
      return Colors.green;
    case "CANCELLED":
      return Colors.red;
    case "REQUEST_RETURN":
      return Colors.purple;
    default:
      return Colors.grey;
  }
}

Color statusItemColor(String status) {
  switch (status) {
    case "IN":
      return Colors.green;
    case "OUT":
      return Colors.red;
    case "INSTALLED":
      return Colors.blue;
    default:
      // Return warna default untuk status tidak diketahui
      return Colors.grey;
  }
}
