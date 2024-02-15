import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/cart/view/modal_add_to_cart.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/empty_widget_image.dart';
import '../../../../widgets/widgets.dart';
import '../../../cart/cubit/cart_cubit.dart';
import 'order_detail_view.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

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
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      controller: cubit.searchController,
                      onChanged: (value) {
                        cubit.searchProduct(value);
                      },
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              cubit.searchController.clear();
                              cubit.searchProduct("");
                            },
                            child: const Icon(
                              Icons.close,
                              size: 16,
                            ),
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
                          status: DataStateStatus.success,
                          loading: const SizedBox(),
                          emptyOptions: EmptyOptions(
                            customEmpty: CategoryWidget(cubit: cubit),
                          ),
                          child: CategoryWidget(cubit: cubit),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Scaffold(
                    floatingActionButton: FloatingActionButton.extended(
                        onPressed: () {
                          context
                              .pushNamed(RouteNames.cretaeProduct)
                              .then((value) => cubit.refreshData());
                        },
                        label: Text(
                          "+ Tambah Produk",
                          style: AppFont.whiteLarge(context),
                        )),
                    body: BlocBuilder<CatalogCubit, CatalogState>(
                        builder: (context, state) {
                      return ContainerStateHandler(
                        refresherOptions: cubit.defaultRefresh,
                        status: state.status,
                        loading: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        emptyOptions: EmptyOptions(
                            customEmpty: const EmptyImageData(
                          text: "Produk Kosong",
                        )),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(12),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).size.width ~/ 330,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 219 / 272),
                          itemBuilder: (BuildContext context, int index) {
                            var product = state.product[index];
                            return CustomButton(
                              onPressed: () {
                                modalAddToCart(
                                  context,
                                  controller: cubit.quantityController,
                                  onSubmit: () {
                                    cubit
                                        .addToCart(
                                            idProduct: product.id!,
                                            quantity: int.parse(
                                                cubit.quantityController.text))
                                        .then((value) => context
                                            .read<CartCubit>()
                                            .refreshData());
                                  },
                                  onCancel: () {
                                    context.pop();
                                    cubit.quantityController.clear();
                                  },
                                ).then((value) {
                                  cubit.quantityController.clear();
                                  context.read<CartCubit>().refreshData();
                                });
                              },
                              child: Container(
                                width: 219,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 16, 12),
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
                                      style: AppFont.large(context)!
                                          .copyWith(fontSize: 16),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "SKU: ${product.sku}",
                                      style: AppFont.medium(context)!
                                          .copyWith(fontSize: 12),
                                    ),
                                    const SizedBox(height: 8),
                                    (product.discount == 0)
                                        ? const SizedBox()
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                "Rp.${product.price?.toInt().currencyFormat()}",
                                                style: AppFont.largePrimary(
                                                        context)!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                color: Colors.black,
                                                indent: 80,
                                                endIndent: 80,
                                              )
                                            ],
                                          ),
                                    Text(
                                      "Rp. ${(product.price! - product.discount!).toInt().currencyFormat()}"
                                          .toString(),
                                      style: AppFont.largePrimary(context)!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount:
                              state.product.length, // Jumlah total item produk
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

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.cubit,
  });

  final CatalogCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: cubit.state.category.length,
          itemBuilder: (context, index) {
            var category = cubit.state.category[index];
            return FilterButton(
                onPressed: () {
                  cubit.selectCategory(category.id ?? "");
                },
                title: category.category ?? "",
                isActive:
                    (cubit.state.selectCategory == category.id) ? true : false);
          },
        ),
      ),
    );
  }
}

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ContainerStateHandler(
          status: DataStateStatus.success,
          loading: SizedBox(),
          child: Align(
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
          ),
        );
      },
    );
  }
}
