import 'package:armory/engine/configs/environment.dart';
import 'package:armory/modules/catalog/cubit/catalog_cubit.dart';
import 'package:armory/resources/resources.dart';
import 'package:armory/widgets/components/image_load.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/base/product.dart';
import '../../../engine/base/app.dart';
import '../../../routes/routes.dart';
import '../../../themes/themes.dart';

class ProductCard extends StatelessWidget {
  final CatalogCubit cubit;
  final Product catalog;
  const ProductCard({super.key, required this.catalog, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
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
                  Row(
                    children: [
                      Text(catalog.codeProduct ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: AppColor.appColor.success,
                                  fontWeight: FontWeight.w600)),
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: () {
                            context
                                .pushNamed(RouteNames.editProduct,
                                    extra: catalog.id)
                                .then((value) => cubit.refreshData());
                          },
                          child: const Icon(Icons.edit))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
