/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/catalog_active.svg
  SvgGenImage get catalogActive =>
      const SvgGenImage('assets/icons/catalog_active.svg');

  /// File path: assets/icons/catalog_inactive.svg
  SvgGenImage get catalogInactive =>
      const SvgGenImage('assets/icons/catalog_inactive.svg');

  /// File path: assets/icons/profile_active.svg
  SvgGenImage get profileActive =>
      const SvgGenImage('assets/icons/profile_active.svg');

  /// File path: assets/icons/profile_inactive.svg
  SvgGenImage get profileInactive =>
      const SvgGenImage('assets/icons/profile_inactive.svg');

  /// File path: assets/icons/report_active.svg
  SvgGenImage get reportActive =>
      const SvgGenImage('assets/icons/report_active.svg');

  /// File path: assets/icons/report_inactive.svg
  SvgGenImage get reportInactive =>
      const SvgGenImage('assets/icons/report_inactive.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        catalogActive,
        catalogInactive,
        profileActive,
        profileInactive,
        reportActive,
        reportInactive
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Appetizercashier-active.png
  AssetGenImage get appetizercashierActive =>
      const AssetGenImage('assets/images/Appetizercashier-active.png');

  /// File path: assets/images/Appetizercashier-inactive.png
  AssetGenImage get appetizercashierInactive =>
      const AssetGenImage('assets/images/Appetizercashier-inactive.png');

  /// File path: assets/images/account_balance.png
  AssetGenImage get accountBalance =>
      const AssetGenImage('assets/images/account_balance.png');

  /// File path: assets/images/bacground_auth.png
  AssetGenImage get bacgroundAuth =>
      const AssetGenImage('assets/images/bacground_auth.png');

  /// File path: assets/images/box.png
  AssetGenImage get box => const AssetGenImage('assets/images/box.png');

  /// File path: assets/images/catalog-active.png
  AssetGenImage get catalogActive =>
      const AssetGenImage('assets/images/catalog-active.png');

  /// File path: assets/images/catalog-inactive.png
  AssetGenImage get catalogInactive =>
      const AssetGenImage('assets/images/catalog-inactive.png');

  /// File path: assets/images/gems.png
  AssetGenImage get gems => const AssetGenImage('assets/images/gems.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/ic_withdrawl_active.png
  AssetGenImage get icWithdrawlActive =>
      const AssetGenImage('assets/images/ic_withdrawl_active.png');

  /// File path: assets/images/ic_withdrawl_inactive.png
  AssetGenImage get icWithdrawlInactive =>
      const AssetGenImage('assets/images/ic_withdrawl_inactive.png');

  /// File path: assets/images/icon-pos.png
  AssetGenImage get iconPos =>
      const AssetGenImage('assets/images/icon-pos.png');

  /// File path: assets/images/payment-qris.png
  AssetGenImage get paymentQris =>
      const AssetGenImage('assets/images/payment-qris.png');

  /// File path: assets/images/payment-success.png
  AssetGenImage get paymentSuccess =>
      const AssetGenImage('assets/images/payment-success.png');

  /// File path: assets/images/profile_active.png
  AssetGenImage get profileActive =>
      const AssetGenImage('assets/images/profile_active.png');

  /// File path: assets/images/profile_inactive.png
  AssetGenImage get profileInactive =>
      const AssetGenImage('assets/images/profile_inactive.png');

  /// File path: assets/images/report-inactive.png
  AssetGenImage get reportInactive =>
      const AssetGenImage('assets/images/report-inactive.png');

  /// File path: assets/images/report_active.png
  AssetGenImage get reportActive =>
      const AssetGenImage('assets/images/report_active.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appetizercashierActive,
        appetizercashierInactive,
        accountBalance,
        bacgroundAuth,
        box,
        catalogActive,
        catalogInactive,
        gems,
        google,
        icWithdrawlActive,
        icWithdrawlInactive,
        iconPos,
        paymentQris,
        paymentSuccess,
        profileActive,
        profileInactive,
        reportInactive,
        reportActive
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
