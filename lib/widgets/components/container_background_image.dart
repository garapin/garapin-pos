import 'package:flutter/material.dart';

import '../../engine/base/app.dart';
import 'image_load.dart';

class ContainerBackgroundImage extends StatelessWidget {
  final Widget child;
  final ImageProvider? imageProvider;
  final double? paddingBottom;
  final double? radiusBottom;
  final String? imageUrl;

  const ContainerBackgroundImage({
    Key? key,
    required this.child,
    this.imageProvider,
    this.paddingBottom,
    this.radiusBottom,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageBody = Container();
    if (imageProvider != null) {
      imageBody = Image(
        image: imageProvider!,
        fit: BoxFit.cover,
        alignment: FractionalOffset.topCenter,
      );
    }

    if (imageUrl != null) {
      imageBody = ImageLoad(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        errorWidget: Container(
          width: baseWidth,
          height: baseHeight,
          color: Theme.of(context).primaryColor,
        ),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom ?? 0),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(radiusBottom ?? 0),
              ),
              child: Container(
                width: baseWidth,
                height: baseWidth,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom ?? 0),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(radiusBottom ?? 0),
              ),
              child: imageBody,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
