import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/base/transaction.dart';
import '../../../../engine/base/app.dart';
import '../../../../widgets/components/empty_image.dart';
import '../../../../widgets/components/image_load.dart';

class FullImageNetworkWidget extends StatelessWidget {
  final Transaction transaction;
  const FullImageNetworkWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageLoad(
              width: baseWidth,
              imageUrl: Environment.showUrlImage(
                  path: transaction.signatureImage ?? ""),
              fit: BoxFit.contain,
              errorWidget: EmptyImageWidget()),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transaction.instalationImage!.length,
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemBuilder: (context, index) {
              return ImageLoad(
                  width: baseWidth,
                  imageUrl: Environment.showUrlImage(
                      path: transaction.instalationImage![index]),
                  fit: BoxFit.contain,
                  errorWidget: EmptyImageWidget());
            },
          ),
        ],
      ),
    );
  }
}
