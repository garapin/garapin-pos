import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

part 'history_transaction_state.dart';
part 'history_transaction_cubit.freezed.dart';

class HistoryTransactionCubit extends BaseCubit<HistoryTransactionState> {
  HistoryTransactionCubit(BuildContext context)
      : super(context, HistoryTransactionState());

  @override
  Future<void> initData() async {
    loadingState();
    getData();
    finishRefresh(state.status);
  }

  void getData() async {
    final data = await ApiService.historyTransactionToday(context);
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(status: DataStateStatus.empty, inv: data.data));
      } else {
        emit(state.copyWith(status: DataStateStatus.success, inv: data.data));
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
