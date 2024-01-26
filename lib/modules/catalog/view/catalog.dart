import 'package:abditrack_inventory/engine/configs/environment.dart';
import 'package:abditrack_inventory/modules/catalog/view/product_card.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../engine/helpers/options.dart';
import '../../../resources/resources.dart';
import '../cubit/catalog_cubit.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cubit.searchController,
                            onChanged: (value) {
                              cubit.searctProduct(value);
                            },
                            decoration: InputDecoration(
                                suffixIcon: (cubit.searchController.text == "")
                                    ? null
                                    : IconButton(
                                        onPressed: () {
                                          cubit.searchController.clear();
                                          cubit.searctProduct("");
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          size: 16,
                                        )),
                                hintText: "Cari Barang kode product | Nama",
                                hintStyle: AppFont.medium(context)!.copyWith(
                                    color: Colors.black.withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 4),
                Row(
                  children: [
                    CustomButton(
                      onPressed: () {
                        cubit.showFilterBottomSheet(context);
                      },
                      child: Container(
                        height: 35,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(child: Icon(Icons.sort)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FilterButton(
                                onPressed: () {
                                  cubit.filterStatus("ACTIVE");
                                },
                                title: 'Aktif',
                                isActive: cubit.statusFilter.text == "ACTIVE"
                                    ? true
                                    : false),
                            FilterButton(
                                onPressed: () {
                                  cubit.filterStatus("INACTIVE");
                                },
                                title: 'Tidak Aktif',
                                isActive: cubit.statusFilter.text == "INACTIVE"
                                    ? true
                                    : false),
                            FilterButton(
                                onPressed: () {
                                  cubit.filterStatus("ALL");
                                },
                                title: 'Semua',
                                isActive: cubit.statusFilter.text == "ALL"
                                    ? true
                                    : false),
                            Container(
                              width: 2,
                              height: 30,
                              color: AppColor.appColor.primary,
                            ),
                            SizedBox(width: 12),
                            FilterButton(
                              onPressed: () {
                                cubit.sort("latest");
                              },
                              title: 'Terbaru',
                              isActive: cubit.sortProduct.text == "latest"
                                  ? true
                                  : false,
                            ),
                            FilterButton(
                              onPressed: () {
                                cubit.sort("oldest");
                              },
                              title: 'Terlama',
                              isActive: cubit.sortProduct.text == "oldest"
                                  ? true
                                  : false,
                            ),
                            FilterButton(
                              onPressed: () {
                                cubit.sort("az");
                              },
                              title: 'A-Z',
                              isActive:
                                  cubit.sortProduct.text == "az" ? true : false,
                            ),
                            FilterButton(
                              onPressed: () {
                                cubit.sort("za");
                              },
                              title: 'Z-A',
                              isActive:
                                  cubit.sortProduct.text == "za" ? true : false,
                            ),
                            FilterButton(
                              onPressed: () {
                                cubit.sort("quantity_high");
                              },
                              title: 'Barang terbanyak',
                              isActive:
                                  cubit.sortProduct.text == "quantity_high"
                                      ? true
                                      : false,
                            ),
                            FilterButton(
                              onPressed: () {
                                cubit.sort("quantity_low");
                              },
                              title: 'Barang Tersedikit',
                              isActive: cubit.sortProduct.text == "quantity_low"
                                  ? true
                                  : false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CatalogCubit, CatalogState>(
              builder: (context, state) {
                return ContainerStateHandler(
                  refresherOptions: RefresherOptions(
                    controller: cubit.refreshController,
                    onRefresh: cubit.refreshData,
                    onLoading: cubit.loadMoreData,
                    enablePullUp: state.canLoadMore,
                  ),
                  status: state.status,
                  emptyOptions: EmptyOptions(empty: "Produk Kosong"),
                  loading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Inventory",
                                  style: AppFont.largePrimary(context)!
                                      .copyWith(fontSize: 24),
                                ),
                                InkWell(
                                    onTap: () {
                                      cubit.showGrid();
                                    },
                                    child: Icon(state.showGrid == false
                                        ? Icons.view_list
                                        : Icons.view_cozy))
                              ],
                            ),
                          ),
                          (state.showGrid == false)
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.catalog.length,
                                  itemBuilder: (context, index) {
                                    return CustomButton(
                                      borderRadius: BorderRadius.circular(16),
                                      onPressed: () {
                                        context.pushNamed(
                                            RouteNames.productDetail,
                                            extra: state.catalog[index].id);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: AppColor
                                                        .appColor.primary
                                                        .withOpacity(0.1)),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: ImageLoad(
                                                        imageUrl: Environment
                                                            .showUrlImage(
                                                                path: state
                                                                        .catalog[
                                                                            index]
                                                                        .image ??
                                                                    ""),
                                                        fit: BoxFit.cover,
                                                        errorWidget: Resources
                                                            .images.armor
                                                            .image(
                                                                color: Colors
                                                                    .grey))),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.catalog[index].name!
                                                            .toUpperCase() ??
                                                        "",
                                                    style: AppFont.largeBold(
                                                        context),
                                                  ),
                                                  Text(
                                                    "Kode ${state.catalog[index].codeProduct}",
                                                    style:
                                                        AppFont.medium(context),
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 30,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32),
                                                    color: AppColor
                                                        .appColor.primary
                                                        .withOpacity(0.2)),
                                                child: Center(
                                                    child: Text(
                                                        state.catalog[index]
                                                            .quantity
                                                            .toString(),
                                                        style:
                                                            AppFont.whiteLarge(
                                                                    context)!
                                                                .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColor
                                                              .appColor.primary,
                                                        ))),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                          childAspectRatio: 0.58),
                                  itemCount: state.catalog.length,
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      catalog: state.catalog[index],
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "1",
        onPressed: () {
          context.pushNamed(RouteNames.addProduct);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
