import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/data/models/base/product.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../widgets/components/filter_button.dart';

part 'catalog_state.dart';
part 'catalog_cubit.freezed.dart';

class CatalogCubit extends BaseCubit<CatalogState> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController statusFilter = TextEditingController();
  final TextEditingController sortProduct = TextEditingController();
  CatalogCubit(BuildContext context) : super(context, const CatalogState());

  @override
  Future<void> initData(
      {int page = 1,
      String search = "",
      String statusProduct = "ACTIVE",
      String sort = "quantity_high"}) async {
    loadingState();
    getData(search: search, statusProduct: statusProduct, sort: sort);
  }

  Future<void> getData(
      {int page = 1,
      bool force = false,
      String search = "",
      String statusProduct = "ACTIVE",
      String sort = "quantity_high"}) async {
    loadingState(force: force);
    statusFilter.text = statusProduct;
    sortProduct.text = sort;
    List<Product> dataList = state.catalog;
    final response = await ApiService.productAll(context,
        page: page, search: search, status: statusProduct, sort: sort);
    if (response.isSuccess) {
      if (page == 1) dataList = [];
      dataList = dataList + response.data;
      DataStateStatus status = DataStateStatus.success;
      if (dataList.isEmpty) status = DataStateStatus.empty;

      emit(state.copyWith(
        status: status,
        catalog: dataList,
        canLoadMore: page < response.totalPage,
        page: page,
      ));
    } else {
      if (dataList.isNotEmpty) {
        emit(state.copyWith(
          status: DataStateStatus.success,
          canLoadMore: false,
        ));
      } else {
        emit(state.copyWith(
          status: DataStateStatus.error,
          canLoadMore: false,
          err: "error",
        ));
      }
    }

    finishRefresh(state.status);
  }

  @override
  void loadingState({bool force = false}) {
    if (force) {
      emit(state.copyWith(status: DataStateStatus.initial));
    } else {
      if (state.catalog.isNotEmpty) {
        emit(state.copyWith(status: DataStateStatus.loading));
      } else {
        emit(state.copyWith(status: DataStateStatus.initial));
      }
    }
  }

  @override
  Future<void> loadMoreData() => getData(
      page: state.page + 1,
      search: searchController.text,
      statusProduct: statusFilter.text);

  @override
  Future<void> refreshData() => initData(
      page: 1,
      search: searchController.text,
      statusProduct: statusFilter.text,
      sort: sortProduct.text);

  Future<void> searctProduct(String search) async {
    initData(
        search: search,
        statusProduct: statusFilter.text,
        sort: sortProduct.text);
  }

  Future<void> filterStatus(String statusProduct) async {
    statusFilter.text = statusProduct;
    initData(
        search: searchController.text,
        statusProduct: statusProduct,
        sort: sortProduct.text);
  }

  Future<void> sort(String sort) async {
    sortProduct.text = sort;
    initData(
        search: searchController.text,
        statusProduct: statusFilter.text,
        sort: sort);
  }

  showGrid() {
    emit(state.copyWith(showGrid: (state.showGrid) ? false : true));
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sort",
                style: AppFont.largeBold(context)!.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Wrap(
                children: [
                  FilterButton(
                    onPressed: () {
                      sort("latest");
                    },
                    title: 'Terbaru',
                    isActive: sortProduct.text == "latest" ? true : false,
                  ),
                  FilterButton(
                    onPressed: () {
                      sort("oldest");
                    },
                    title: 'Terlama',
                    isActive: sortProduct.text == "oldest" ? true : false,
                  ),
                  FilterButton(
                    onPressed: () {
                      sort("az");
                    },
                    title: 'A-Z',
                    isActive: sortProduct.text == "az" ? true : false,
                  ),
                  FilterButton(
                    onPressed: () {
                      sort("za");
                    },
                    title: 'Z-A',
                    isActive: sortProduct.text == "za" ? true : false,
                  ),
                  FilterButton(
                    onPressed: () {
                      sort("quantity_high");
                    },
                    title: 'Barang terbanyak',
                    isActive:
                        sortProduct.text == "quantity_high" ? true : false,
                  ),
                  FilterButton(
                    onPressed: () {
                      sort("quantity_low");
                    },
                    title: 'Barang Tersedikit',
                    isActive: sortProduct.text == "quantity_low" ? true : false,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Filter",
                style: AppFont.largeBold(context)!.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Wrap(
                children: [
                  FilterButton(
                      onPressed: () {
                        filterStatus("ACTIVE");
                      },
                      title: 'Aktif',
                      isActive: statusFilter.text == "ACTIVE" ? true : false),
                  FilterButton(
                      onPressed: () {
                        filterStatus("INACTIVE");
                      },
                      title: 'Tidak Aktif',
                      isActive: statusFilter.text == "INACTIVE" ? true : false),
                  FilterButton(
                      onPressed: () {
                        filterStatus("ALL");
                      },
                      title: 'Semua',
                      isActive: statusFilter.text == "ALL" ? true : false),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
