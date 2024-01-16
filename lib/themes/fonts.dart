part of 'themes.dart';

class AppFont {
  static TextStyle? whiteMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle? whiteLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize ?? 16,
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle? whiteSmall(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize ?? 12,
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle? whiteTitle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .displayLarge
        ?.copyWith(fontSize: 34, fontWeight: FontWeight.w700);
  }

  static TextStyle? whiteSubtitle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .displayLarge
        ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700);
  }

  static TextStyle? whiteCaption(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 10);
  }

  static TextStyle? special(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14);
  }

  static TextStyle? error(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall?.copyWith(
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14);
  }

  static TextStyle? success(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14);
  }

  static TextStyle? caption(BuildContext context) {
    return small(context)
        ?.copyWith(fontSize: 10, color: AppColor.appColor.caption);
  }

  static TextStyle? medium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  static TextStyle? large(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;

  static TextStyle? small(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  static TextStyle? mediumBold(BuildContext context) =>
      medium(context)?.copyWith(fontWeight: FontWeight.bold);

  static TextStyle? largeBold(BuildContext context) =>
      large(context)?.copyWith(fontWeight: FontWeight.bold);

  static TextStyle? smallBold(BuildContext context) =>
      small(context)?.copyWith(fontWeight: FontWeight.bold);

  static TextStyle? mediumPrimary(BuildContext context) =>
      medium(context)?.copyWith(color: Theme.of(context).primaryColor);

  static TextStyle? largePrimary(BuildContext context) =>
      large(context)?.copyWith(color: Theme.of(context).primaryColor);

  static TextStyle? smallPrimary(BuildContext context) =>
      small(context)?.copyWith(color: Theme.of(context).primaryColor);

  static TextStyle? mediumPrimaryLighten(BuildContext context) =>
      medium(context)
          ?.copyWith(color: Theme.of(context).primaryColor.lighten());

  static TextStyle? largePrimaryLighten(BuildContext context) =>
      large(context)?.copyWith(color: Theme.of(context).primaryColor.lighten());

  static TextStyle? smallPrimaryLighten(BuildContext context) =>
      small(context)?.copyWith(color: Theme.of(context).primaryColor.lighten());
}
