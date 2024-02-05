import 'package:armory/data/api/services.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/base/store.dart';

part 'catalog_state.dart';
part 'catalog_cubit.freezed.dart';

class CatalogCubit extends BaseCubit<CatalogState> {
  CatalogCubit(BuildContext context) : super(context, const CatalogState());

  @override
  Future<void> initData() async {
    final data = await ApiService.getStoreInfo(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
