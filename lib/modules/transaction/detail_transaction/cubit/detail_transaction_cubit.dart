import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/data/models/base/transaction.dart';
import 'package:abditrack_inventory/data/models/base/transaction_detail.dart';
import 'package:abditrack_inventory/data/models/base/transaction_item.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/base/cart.dart';

part 'detail_transaction_state.dart';
part 'detail_transaction_cubit.freezed.dart';

class DetailTransactionCubit extends BaseCubit<DetailTransactionState> {
  final int idTransaction;
  DetailTransactionCubit(BuildContext context, this.idTransaction)
      : super(context, const DetailTransactionState());

  @override
  Future<void> initData() async {
    loadingState();
    getTransaction();
    getTransactionItem();
    finishRefresh(state.status);
  }

  String getRoleUser() {
    String? role = Sessions.getUserModel()!.role;
    return role!;
  }

  void getTransaction() async {
    final detail =
        await ApiService.getTransactionDetail(context, id: idTransaction);
    if (detail.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success, transaction: detail.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  void getTransactionItem() async {
    final data =
        await ApiService.getTransactionItem(context, id: idTransaction);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, item: data.data));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  showTypeImage(ShowImageType showImageType) {
    emit(state.copyWith(showImageType: showImageType));
  }
}

enum ShowImageType {
  signature,
  instalation,
}
