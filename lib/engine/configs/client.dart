part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://armory-be-dev.abditrack.com/api/v1/';
      case EnvironmentMode.production:
        return 'http://armory-be.abditrack.com/api/v1/';
      case EnvironmentMode.test:
        return 'http://192.168.20.154:8000/api/v1/'; // real device
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://armory-be-dev.abditrack.com/';
      case EnvironmentMode.production:
        return 'http://armory-be.abditrack.com/';
      case EnvironmentMode.test:
        return 'http://192.168.20.154:8000/'; //
    }
  }
}
