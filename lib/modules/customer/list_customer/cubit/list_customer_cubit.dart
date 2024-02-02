import 'package:armory/data/api/services.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/base/mitra.dart';
import '../../../../engine/base/base_cubit.dart';
import '../../../../engine/helpers/options.dart';

part 'list_customer_state.dart';
part 'list_customer_cubit.freezed.dart';

class ListCustomerCubit extends BaseCubit<ListCustomerState> {
  ListCustomerCubit(BuildContext context) : super(context, ListCustomerState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.allMitra(context);
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(
            state.copyWith(status: DataStateStatus.empty, allMitra: data.data));
      } else {
        emit(state.copyWith(
            status: DataStateStatus.success, allMitra: data.data));
      }
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
