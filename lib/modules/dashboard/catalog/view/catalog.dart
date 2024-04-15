import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/models/base/product.dart';
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
import '../../../cart/view/order_detail_view.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key, this.modeCatalog});

  final ModeCatalog? modeCatalog;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogCubit>();
    cubit.setMode(modeCatalog ?? ModeCatalog.cashier);
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
            Expanded(child: Scaffold(body:
                BlocBuilder<CatalogCubit, CatalogState>(
                    builder: (context, state) {
              return ContainerStateHandler(
                refresherOptions: cubit.defaultRefresh,
                status: state.status,
                loading: const Center(
                  child: CircularProgressIndicator(),
                ),
                emptyOptions: EmptyOptions(
                    customEmpty: Column(
                  children: [
                    (state.modeCatalog == ModeCatalog.cashier)
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: TextButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.appColor.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          side: BorderSide(
                                            width: 1.5,
                                            color: AppColor.appColor.primary,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        context
                                            .pushNamed(RouteNames.cretaeProduct)
                                            .then(
                                                (value) => cubit.refreshData());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 0),
                                        child: Text(
                                          "Buat Produk",
                                          style: AppFont.largeBold(context)!
                                              .copyWith(color: Colors.white),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                    (modeCatalog == ModeCatalog.edit)
                        ? SizedBox()
                        : SizedBox(height: 60),
                    const EmptyImageData(
                      text: "Produk Kosong",
                    ),
                  ],
                )),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    (state.modeCatalog == ModeCatalog.cashier)
                        ? const SizedBox(height: 0)
                        : SizedBox(height: 12),
                    (state.modeCatalog == ModeCatalog.cashier)
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: TextButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.appColor.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          side: BorderSide(
                                            width: 1.5,
                                            color: AppColor.appColor.primary,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        context
                                            .pushNamed(RouteNames.cretaeProduct)
                                            .then(
                                                (value) => cubit.refreshData());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 0),
                                        child: Text(
                                          "Buat Produk",
                                          style: AppFont.largeBold(context)!
                                              .copyWith(color: Colors.white),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                    Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).size.width ~/ 259,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 20,
                            childAspectRatio: 200 / 272),
                        itemBuilder: (BuildContext context, int index) {
                          var product = state.product[index];
                          return InkWell(
                            onTap: () {
                              if (state.modeCatalog == ModeCatalog.edit) {
                                context
                                    .pushNamed(RouteNames.editProduct,
                                        extra: product.id)
                                    .then((value) => cubit.refreshData());
                              } else {
                                cubit
                                    .addToCart(
                                        idProduct: product.id!, quantity: 1)
                                    .then((value) => context
                                        .read<CartCubit>()
                                        .refreshData());
                              }
                            },
                            child: (product.image == "")
                                ? catalogWithIcon(
                                    state, context, product, cubit)
                                : catalogWithImage(
                                    state, context, product, cubit),
                          );
                        },
                        itemCount:
                            state.product.length, // Jumlah total item produk
                      ),
                    ),
                  ],
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

  Container catalogWithIcon(CatalogState state, BuildContext context,
      Product product, CatalogCubit cubit) {
    return Container(
      width: 219,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.appColor.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
      child: Stack(
        children: [
          (state.modeCatalog == ModeCatalog.edit)
              ? Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        context
                            .pushNamed(RouteNames.editProduct,
                                extra: product.id)
                            .then((value) => cubit.refreshData());
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                        color: AppColor.appColor.background,
                      )),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: ImageLoad(
                    imageUrl:
                        Environment.showUrlImage(path: product.icon ?? ""),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.name ?? "",
                  style: AppFont.whiteLarge(context)!.copyWith(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
                Text(
                  "SKU: ${product.sku}",
                  style: AppFont.whiteMedium(context)!.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 4),
                (product.discount == 0)
                    ? const SizedBox()
                    : Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Text(
                            "Rp.${product.price?.toInt().currencyFormat()}",
                            style: AppFont.whiteLarge(context)!.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 1,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                Text(
                  "Rp. ${(product.price! - product.discount!).toInt().currencyFormat()}"
                      .toString(),
                  style: AppFont.whiteLarge(context)!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container catalogWithImage(CatalogState state, BuildContext context,
    Product product, CatalogCubit cubit) {
  return Container(
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
    padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
    child: Stack(
      children: [
        Column(
          children: [
            Container(
              width: 202,
              height: 100,
              child: ImageLoad(
                imageUrl: Environment.showUrlImage(path: product.image ?? ""),
                fit: BoxFit.contain,
                errorWidget: ImageLoad(
                  imageUrl: Environment.showUrlImage(path: product.icon ?? ""),
                  height: 10,
                  width: 10,
                  fit: BoxFit.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name ?? "",
              style: AppFont.largeBold(context)!.copyWith(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "SKU: ${product.sku}",
              style: AppFont.medium(context)!.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 4),
            (product.discount == 0)
                ? const SizedBox()
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "Rp.${product.price?.toInt().currencyFormat()}",
                        style: AppFont.largePrimary(context)!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 1,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
            Text(
              "Rp. ${(product.price! - product.discount!).toInt().currencyFormat()}"
                  .toString(),
              style: AppFont.largePrimary(context)!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        (state.modeCatalog == ModeCatalog.edit)
            ? Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      context
                          .pushNamed(RouteNames.editProduct, extra: product.id)
                          .then((value) => cubit.refreshData());
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 30,
                      color: AppColor.appColor.primary,
                    )),
              )
            : const SizedBox(),
      ],
    ),
  );
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ContainerStateHandler(
          status: state.status,
          loading: const SizedBox(),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 350,
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
                  const RealTimeClock(),
                  const SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: ImageLoad(
                        fit: BoxFit.cover,
                        isCircle: true,
                        imageUrl: auth.currentUser?.photoURL ?? ""),
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

class RealTimeClock extends StatefulWidget {
  const RealTimeClock({super.key});

  @override
  _RealTimeClockState createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  late Stream<DateTime> _dateTimeStream;

  @override
  void initState() {
    super.initState();
    _dateTimeStream = Stream<DateTime>.periodic(
        const Duration(seconds: 1), (index) => DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _dateTimeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data?.toddMMMyyyyHHmmss() ?? "                   ",
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
