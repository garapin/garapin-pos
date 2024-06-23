part of 'environment.dart';

abstract class Development {
  static String appName = 'Abditrack Inventory';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'https://3981-158-140-162-172.ngrok-free.app/';
      case EnvironmentMode.test:
        return 'https://fad2-158-140-162-158.ngrok-free.app/';
      case EnvironmentMode.production:
        return 'https://garapinpos.garapin.cloud/'; // real device
    }
  }

  static String urlImage() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'https://3981-158-140-162-172.ngrok-free.app/';
      case EnvironmentMode.test:
        return 'http://192.168.1.15:4000/';
      case EnvironmentMode.production:
        return 'https://garapinpos.garapin.cloud/'; // real device
    }
  }
}
