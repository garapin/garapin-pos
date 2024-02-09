part of 'themes.dart';

///
/// Created by alfianhpratama on 10/11/22
///

class AppColorData {
  final Color primary;
  final Color secondary;
  final List<Color> gradient;
  final Color error;
  final Color warning;
  final Color background;
  final Color bottomNavigation;
  final Color active;
  final Color success;
  final Color inactive;
  final Color caption;
  final Color special;

  AppColorData({
    this.primary = const Color(0xFF713F97),
    this.secondary = const Color(0xFF016A70),
    this.gradient = const [Colors.blueAccent, Colors.blueGrey],
    this.error = Colors.red,
    this.warning = const Color.fromARGB(255, 229, 109, 3),
    this.background = const Color(0xFFFDFDFD),
    this.bottomNavigation = const Color(0xFFFEFEFE),
    this.active = Colors.blue,
    this.success = Colors.green,
    this.inactive = const Color(0xFF101010),
    this.caption = const Color(0xFF545454),
    this.special = Colors.orange,
  });
}

class AppColor {
  static AppColorData appColor = AppColorData();
}
