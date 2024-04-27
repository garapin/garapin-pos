import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

part 'detail_transaction_product_state.dart';
part 'detail_transaction_product_cubit.freezed.dart';

class DetailTransactionProductCubit
    extends BaseCubit<DetailTransactionProductState> {
  final Map<String, String> args;
  DetailTransactionProductCubit(BuildContext context, this.args)
      : super(context, DetailTransactionProductState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(trxName: args["trx"]));
    getInvoice();
    finishRefresh(state.status);
  }

  getInvoice() async {
    final data = await ApiService.transactionDetailProduct(context,
        invoice: args["invoice"]!, targetDatabase: args["database"]!);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, invoice: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
