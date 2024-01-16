import 'dart:developer';
import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/base/transaction.dart';

part 'list_transaction_state.dart';
part 'list_transaction_cubit.freezed.dart';

class ListTransactionCubit extends BaseCubit<ListTransactionState> {
  TextEditingController statusTransaction = TextEditingController();
  ListTransactionCubit(BuildContext context)
      : super(context, const ListTransactionState());

  @override
  Future<void> initData({String status = "ALL"}) async {
    statusTransaction.text = status;
    log(statusTransaction.text);
    final data = await ApiService.getListTransaction(context,
        status: statusTransaction.text);
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(
          status: DataStateStatus.empty,
          listTransaction: data.data,
        ));
      } else {
        emit(state.copyWith(
          status: DataStateStatus.success,
          listTransaction: data.data,
        ));
      }
    } else {
      emit(state.copyWith(
        status: DataStateStatus.error,
        err: data.message,
      ));
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
    statusTransaction.text = status;
    initData(status: statusTransaction.text);
  }
}
