import 'package:pos/data/api/services.dart';
import 'package:pos/engine/engine.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/base/category.dart';
import '../../../../data/models/base/product.dart';
import '../../../../data/models/base/store.dart';

part 'catalog_state.dart';
part 'catalog_cubit.freezed.dart';

class CatalogCubit extends BaseCubit<CatalogState> {
  final TextEditingController searchController = TextEditingController();
  CatalogCubit(BuildContext context) : super(context, const CatalogState());

  @override
  Future<void> initData(
      {String search = "", String category2 = "Semua"}) async {
    getData(search: search, category2: category2);
  }

  void getData({String search = "", String category2 = "Semua"}) async {
    final data = await ApiService.getStoreInfo(context);
    final productAll =
        await ApiService.catalog(context, search: search, category: category2);
    final category = await ApiService.category(context);
    if (data.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success,
          store: data.data,
          search: search,
          selectCategory: category2,
          product: productAll.data,
          category: category.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData(
      search: state.search ?? "", category2: state.selectCategory ?? "");

  searchProduct(String search) {
    initData(search: search, category2: state.selectCategory ?? "");
  }

  selectCategory(String categoryId) {
    initData(search: state.search ?? "", category2: categoryId);
  }
}
