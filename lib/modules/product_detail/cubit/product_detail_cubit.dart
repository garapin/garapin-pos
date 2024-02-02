import 'package:armory/data/api/services.dart';
import 'package:armory/data/models/base/item.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends BaseCubit<ProductDetailState> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final String idProduct;
  ProductDetailCubit(BuildContext context, this.idProduct)
      : super(context, const ProductDetailState());

  @override
  Future<void> initData(
      {int page = 1, String search = "", String status = "ALL"}) async {
    loadingState();
    getData(search: search, status: status);
  }

  Future<void> getData(
      {int page = 1,
      bool force = false,
      String search = "",
      String status = "ALL"}) async {
    loadingState(force: force);
    statusController.text = status;
    List<Item> dataList = state.product;
    final response = await ApiService.getItemByProductID(context,
        page: page, search: search, id: idProduct, status: status); //all/in/out
    if (response.isSuccess) {
      if (page == 1) dataList = [];
      dataList = dataList + response.data;
      DataStateStatus status = DataStateStatus.success;
      if (dataList.isEmpty) status = DataStateStatus.empty;

      emit(state.copyWith(
        status: status,
        product: dataList,
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
      if (state.product.isNotEmpty) {
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
      status: statusController.text);

  @override
  Future<void> refreshData() =>
      initData(search: searchController.text, status: statusController.text);

  Future<void> searctProduct(String search) =>
      initData(search: search, status: statusController.text);

  Future<void> statusProduct(String status2) async {
    statusController.text = status2;
    initData(search: searchController.text, status: status2);
  }
}
