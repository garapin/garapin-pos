import 'package:abditrack_inventory/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/services.dart';
import '../../../data/models/base/transaction.dart';
import '../../../engine/base/base_cubit.dart';

part 'homepage_state.dart';
part 'homepage_cubit.freezed.dart';

class HomepageCubit extends BaseCubit<HomepageState> {
  HomepageCubit(BuildContext context) : super(context, HomepageState());

  @override
  Future<void> initData({String status = "REQUEST_RETURN"}) async {
    final data = await ApiService.getListTransaction(context, status: status);
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(
            status: DataStateStatus.empty,
            listTransaction: data.data,
            filterStatus: status));
      } else {
        emit(state.copyWith(
            status: DataStateStatus.success,
            listTransaction: data.data,
            filterStatus: status));
      }
    } else {
      emit(state.copyWith(
          status: DataStateStatus.error,
          err: data.message,
          filterStatus: status));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() => initData();

  changeStatus(String status) async {
    initData(status: status);
  }
}
