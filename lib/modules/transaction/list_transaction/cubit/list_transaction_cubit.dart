import 'dart:developer';
import 'package:armory/data/api/services.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/base/transaction.dart';

part 'list_transaction_state.dart';
part 'list_transaction_cubit.freezed.dart';

class ListTransactionCubit extends BaseCubit<ListTransactionState> {
  ListTransactionCubit(BuildContext context)
      : super(context, const ListTransactionState());

  @override
  Future<void> initData({String status = "ALL"}) async {
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
