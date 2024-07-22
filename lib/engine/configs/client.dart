part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'https://6d91-36-90-3-229.ngrok-free.app/';
      case EnvironmentMode.test:
        return 'https://garapinpos-test.garapin.cloud/';
      case EnvironmentMode.production:
        return 'https://garapinpos.garapin.cloud/'; // real device
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'https://6d91-36-90-3-229.ngrok-free.app/';
      case EnvironmentMode.test:
        return 'https://garapinpos-test.garapin.cloud/';
      case EnvironmentMode.production:
        return 'https://garapinpos.garapin.cloud/'; // real device
    }
  }
}
