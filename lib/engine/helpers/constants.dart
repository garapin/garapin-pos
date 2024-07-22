abstract class APIResult {
  static const int success = 200;
  static const int failed = 404;
  static const int invalid = 401;
}

abstract class SessionKeys {
  static const String user = 'userData';
  static const String token = 'token';
  static const String isLogin = 'islogin';
  static const String database = 'database';
  static const String accountHolder = 'account_holder';
  static const String bluetooth = "bluethooth";
  static const String isPayedQuickRelease = "isPayedQuickRelease";
}
