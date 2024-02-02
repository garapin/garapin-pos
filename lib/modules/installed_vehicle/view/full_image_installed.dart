import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/base/transaction.dart';
import '../../../../engine/base/app.dart';
import '../../../../widgets/components/empty_image.dart';
import '../../../../widgets/components/image_load.dart';

class FullImageInstalled extends StatelessWidget {
  final List<String> image;
  const FullImageInstalled({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: image.length,
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ImageLoad(
                    imageUrl: Environment.showUrlImage(path: image[index]),
                    fit: BoxFit.contain,
                    errorWidget: EmptyImageWidget()),
              );
            },
          ),
        ],
      ),
    );
  }
}
