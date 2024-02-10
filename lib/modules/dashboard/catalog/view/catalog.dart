import 'package:flutter/widgets.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/themes/themes.dart';

import '../../../../engine/base/app.dart';
import '../../../../widgets/widgets.dart';
import 'order_detail_view.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogCubit>();
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              height: 78,
              width: baseWidth * 0.91,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.close,
                            size: 16,
                          ),
                          hintText: "Cari Barang kode product | Nama",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    height: 78,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: BlocBuilder<CatalogCubit, CatalogState>(
                      builder: (context, state) {
                        return ContainerStateHandler(
                          status: state.status,
                          loading: SizedBox(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.category.length,
                                itemBuilder: (context, index) {
                                  var category = state.category[index];
                                  return FilterButton(
                                      title: category.category ?? "",
                                      isActive: true);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Scaffold(body:
                BlocBuilder<CatalogCubit, CatalogState>(
                    builder: (context, state) {
              return ContainerStateHandler(
                refresherOptions: cubit.defaultRefresh,
                status: state.status,
                loading: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width ~/ 330,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 219 / 272),
                  itemBuilder: (BuildContext context, int index) {
                    var product = state.product[index];
                    return Container(
                      width: 219, // Lebar tetap container
                      height: 300, // Tinggi tetap container
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(16), // Radius border
                        color: Colors.white, // Warna latar belakang
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), // Warna bayangan
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
                      child: Column(
                        children: [
                          Container(
                            width: 202,
                            height: 158,
                            child: ImageLoad(
                              imageUrl: Environment.showUrlImage(
                                  path: product.image ?? ""),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            product.name ?? "",
                            style:
                                AppFont.large(context)!.copyWith(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "SKU: ${product.sku}",
                            style:
                                AppFont.medium(context)!.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rp.${product.price}",
                            style: AppFont.largePrimary(context)!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: state.product.length, // Jumlah total item produk
                ),
              );
            })))
          ]),
        ),
        const Expanded(
          flex: 1,
          child: OrderDetailView(),
        )
      ],
    );
  }
}

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 400,
        height: 44,
        child: Row(
          children: [
            const Row(
              children: [
                Icon(Icons.history),
                SizedBox(
                  width: 8,
                ),
                Text("History")
              ],
            ),
            const SizedBox(width: 20),
            Text(DateTime.now().toString()),
            const SizedBox(width: 20),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
