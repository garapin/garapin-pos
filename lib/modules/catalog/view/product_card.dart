import 'package:abditrack_inventory/engine/configs/environment.dart';
import 'package:abditrack_inventory/resources/resources.dart';
import 'package:abditrack_inventory/widgets/components/image_load.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/base/product.dart';
import '../../../engine/base/app.dart';
import '../../../routes/routes.dart';
import '../../../themes/themes.dart';
import '../../../widgets/components/custom_button.dart';

class ProductCard extends StatelessWidget {
  final Product catalog;
  const ProductCard({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(16),
      onPressed: () {
        context.pushNamed(RouteNames.productDetail, extra: catalog.id);
      },
      child: Card(
        color: (catalog.quantity! < 1) ? Colors.white.withOpacity(0.6) : null,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 180,
              width: baseWidth,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageLoad(
                      imageUrl:
                          Environment.showUrlImage(path: catalog.image ?? ""),
                      fit: BoxFit.cover,
                      errorWidget:
                          Resources.images.armor.image(color: Colors.grey))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catalog.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    (catalog.quantity! < 1)
                        ? "Stok Habis"
                        : "jumlah barang ${catalog.quantity.toString()}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(catalog.codeProduct ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColor.appColor.success,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
