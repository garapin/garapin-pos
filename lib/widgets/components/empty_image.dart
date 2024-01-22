import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../resources/resources.dart';
import '../../themes/themes.dart';

class EmptyImageWidget extends StatelessWidget {
  const EmptyImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Resources.images.armor.image(color: Colors.grey),
          Text(
            "Belum ada Image",
            style: AppFont.largePrimary(context)!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
