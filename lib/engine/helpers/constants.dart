abstract class APIResult {
  static const int success = 200;
  static const int failed = 404;
  static const int invalid = 401;
}

abstract class SessionKeys {
  static const String token = 'token';
  static const String device = 'device';
  static const String driver = 'driver';
  static const String theme = 'theme';
  static const String userData = 'user';
  static const String kiosk = 'kiosk';
  static const String isLogin = 'islogin';
}
