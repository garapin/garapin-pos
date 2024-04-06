part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://192.168.160.113:4000/';
      case EnvironmentMode.test:
        return 'http://192.168.18.44:4000/';
      case EnvironmentMode.production:
        return 'https://garapinpos.garapin.cloud/'; // real device
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        //kantor
        return 'http://192.168.18.235:4000/';
      case EnvironmentMode.test:
        return 'http://192.168.18.44:4000/';
      case EnvironmentMode.production:
        return 'https://garapinpos.garapin.cloud/'; // real device
    }
  }
}
