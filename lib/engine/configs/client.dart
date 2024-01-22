part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://192.168.20.59:8000/api/v1/'; // real device
      case EnvironmentMode.production:
        return '';
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://192.168.20.59:8000/'; // real device
      case EnvironmentMode.production:
        return '';
    }
  }
}
