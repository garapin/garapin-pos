import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../engine/base/app.dart';
import '../../resources/resources.dart';
import '../../themes/themes.dart';

class ImageLoad extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final String? imageError;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final EdgeInsets? padding;
  final bool isCircle;
  final double? radius;
  final Color? colorBlend;
  final ImageWidgetBuilder? imageBuilder;
  final Widget? errorWidget;
  final Alignment alignment;

  const ImageLoad({
    Key? key,
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.imageError,
    this.width,
    this.height,
    this.fit,
    this.padding,
    this.isCircle = false,
    this.radius,
    this.colorBlend,
    this.imageBuilder,
    this.errorWidget,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ph = placeholder ?? Resources.images.google.path;

    Widget child = CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (ctx, url) {
        return Container(
          width: baseWidth,
          height: baseWidth,
          color: Colors.black12,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      imageBuilder: imageBuilder,
      alignment: alignment,
      errorWidget: (ctx, url, error) {
        log('Get image error: $error');
        return errorWidget ?? Image.asset(ph, fit: fit ?? BoxFit.cover);
      },
    );

    if (kIsWeb) {
      child = Image.network(imageUrl, fit: fit, width: width, height: height);
    }

    if (imageUrl.isEmpty || imageUrl == 'null') {
      log('Failed get image from url: ${(imageUrl.isEmpty) ? 'empty url' : imageUrl}');
      child = errorWidget ?? Image.asset(ph, fit: fit ?? BoxFit.cover);
    }

    if (colorBlend != null) {
      child = ColorFiltered(
        colorFilter: ColorFilter.mode(colorBlend!, BlendMode.darken),
        child: child,
      );
    }

    if (isCircle) {
      child = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appColor.active,
        ),
        height: radius,
        width: radius,
        child: ClipOval(child: child),
      );
    }

    if (padding != null) {
      return Container(padding: padding, child: child);
    } else {
      return child;
    }
  }
}
