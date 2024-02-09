import 'package:pos/engine/base/app.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/themes/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgorundImageWidget extends StatelessWidget {
  final Widget child;
  const BackgorundImageWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Resources.images.bacgroundAuth.image(
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    ));
  }
}
