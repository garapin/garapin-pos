import 'dart:developer';
import 'package:abditrack_inventory/data/api/services.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../data/models/base/transaction.dart';
import '../../../../../engine/base/base_cubit.dart';
import '../../../../../engine/helpers/options.dart';

part 'list_transaction_teknisi_state.dart';
part 'list_transaction_teknisi_cubit.freezed.dart';

class ListTransactionTeknisiCubit
    extends BaseCubit<ListTransactionTeknisiState> {
  ListTransactionTeknisiCubit(BuildContext context)
      : super(context, const ListTransactionTeknisiState());

  @override
  Future<void> initData({String status = "ALL"}) async {
    final data =
        await ApiService.getListTransactionByTeknisi(context, status: status);
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(
          filterStatus: status,
          status: DataStateStatus.empty,
          listTransaction: data.data,
        ));
      } else {
        emit(state.copyWith(
          filterStatus: status,
          status: DataStateStatus.success,
          listTransaction: data.data,
        ));
      }
    } else {
      emit(state.copyWith(
        filterStatus: status,
        status: DataStateStatus.error,
        err: data.message,
      ));
    }
    log(status);
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
