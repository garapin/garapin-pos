import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/data/models/base/instalation_vehicle.dart';
import 'package:abditrack_inventory/data/models/base/transaction.dart';
import 'package:abditrack_inventory/data/models/base/transaction_item.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    getInstalationVehicle();
    finishRefresh(state.status);
  }

  String getRoleUser() {
    String? role = Sessions.getUserModel()!.role;
    return role!;
  }

  int getIdTransaction() {
    return idTransaction;
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

  showItemType(ShowItemType showItemType) {
    emit(state.copyWith(showItemType: showItemType));
  }

  getInstalationVehicle() async {
    final data = await ApiService.getInsalationVehicleByIdTransaction(context,
        idTransaction: idTransaction);
    emit(state.copyWith(listInstalationVehicle: data.data));
  }
}

enum ShowImageType {
  signature,
  instalation,
}

enum ShowItemType { installed, bring }
