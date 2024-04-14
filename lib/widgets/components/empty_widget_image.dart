import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../../themes/themes.dart';

class EmptyImageData extends StatelessWidget {
  final String? text;
  const EmptyImageData({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text ?? "Data Kosong",
          style: AppFont.largeBold(context)!
              .copyWith(color: Colors.grey, fontSize: 18),
        ),
        // Center(child: Resources.images.box.image(height: 100)),
      ],
    );
  }
}
