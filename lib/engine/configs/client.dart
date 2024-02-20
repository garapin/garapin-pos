part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://192.168.8.209:4000/';
      case EnvironmentMode.test:
        return 'http://192.168.8.209:4000/';
      case EnvironmentMode.production:
        return 'http://192.168.8.209:4000/'; // real device
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://192.168.8.209:4000/';
      case EnvironmentMode.test:
        return 'http://192.168.8.209:4000/';
      case EnvironmentMode.production:
        return 'http://192.168.8.209:4000/'; // real device
    }
  }
}
