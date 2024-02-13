part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://pos-be-dev.abditrack.com/api/v1/';
      case EnvironmentMode.test:
        return 'http://192.168.20.154:4000/';
      case EnvironmentMode.production:
        return 'http://192.168.100.18:4000/'; // real device
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://pos-be-dev.abditrack.com/';
      case EnvironmentMode.test:
        return 'http://192.168.20.154:4000/';
      case EnvironmentMode.production:
        return 'http://192.168.100.18:4000/'; // real device
    }
  }
}
