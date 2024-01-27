import 'package:abditrack_inventory/modules/installed_vehicle/cubit/installed_vehicle_cubit.dart';
import 'package:abditrack_inventory/modules/product_detail/cubit/product_detail_cubit.dart';
import 'package:abditrack_inventory/widgets/components/empty_widget_image.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/base/item.dart';
import '../../../engine/helpers/color_status.dart';
import '../../../engine/helpers/options.dart';
import '../../../routes/routes.dart';
import '../../../themes/themes.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Barang")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SizedBox(
                width: double.infinity,
                height: 50,
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
                      hintText:
                          "Cari Barang kode product | imei | serial number",
                      hintStyle: AppFont.medium(context)!
                          .copyWith(color: Colors.black.withOpacity(0.7)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterButton(
                        onPressed: () {
                          cubit.statusProduct("ALL");
                        },
                        title: 'Semua',
                        isActive: cubit.statusController.text == "ALL"
                            ? true
                            : false),
                    FilterButton(
                        onPressed: () {
                          cubit.statusProduct("IN");
                        },
                        title: 'IN',
                        isActive:
                            cubit.statusController.text == "IN" ? true : false),
                    FilterButton(
                        onPressed: () {
                          cubit.statusProduct("OUT");
                        },
                        title: 'OUT',
                        isActive: cubit.statusController.text == "OUT"
                            ? true
                            : false),
                    FilterButton(
                        onPressed: () {
                          cubit.statusProduct("INSTALLED");
                        },
                        title: 'INSTALLED',
                        isActive: cubit.statusController.text == "INSTALLED"
                            ? true
                            : false),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
              builder: (context, state) {
                return ContainerStateHandler(
                  emptyOptions: EmptyOptions(
                      customEmpty: const EmptyImageData(
                    text: "Barang Kosong",
                  )),
                  refresherOptions: RefresherOptions(
                    controller: cubit.refreshController,
                    onRefresh: cubit.refreshData,
                    onLoading: cubit.loadMoreData,
                    enablePullUp: state.canLoadMore,
                  ),
                  loading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  status: state.status,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.product.length,
                    itemBuilder: (context, index) {
                      var item = state.product[index];
                      return CustomButton(
                        borderRadius: BorderRadius.circular(16),
                        onPressed: () {
                          if (item.status == "INSTALLED") {
                            context.pushNamed(RouteNames.installedVehicle,
                                extra: {
                                  "id": item.id,
                                  "type": TypeInstalledBy.idProductItem
                                });
                          }
                        },
                        child: ItemWidget(
                          item: item,
                          index: index,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;
  final int index;
  const ItemWidget({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: statusItemColor(item.status?.toUpperCase() ?? "")),
                child: Text(
                  (index + 1).toString(),
                  style: AppFont.whiteLarge(context),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.noProduct} - ${item.name?.toUpperCase()}",
                      style: AppFont.largeBold(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "IMEI ${item.imei} | SN ${item.noSn}",
                      style: AppFont.medium(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: statusItemColor(item.status?.toUpperCase() ?? "")
                          .withOpacity(0.2)),
                  child: Center(
                      child: Text(item.status?.toUpperCase() ?? "",
                          style: AppFont.whiteLarge(context)!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: statusItemColor(
                                item.status?.toUpperCase() ?? ""),
                          ))))
            ])));
  }
}
