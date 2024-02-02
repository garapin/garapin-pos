import 'package:armory/data/api/services.dart';
import 'package:armory/data/models/base/instalation_vehicle.dart';
import 'package:armory/data/models/base/transaction.dart';
import 'package:armory/data/models/base/transaction_item.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_transaction_state.dart';
part 'detail_transaction_cubit.freezed.dart';

class DetailTransactionCubit extends BaseCubit<DetailTransactionState> {
  final Map<String, dynamic> params;

  DetailTransactionCubit(BuildContext context, this.params)
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
    return params["id_transaction"];
  }

  void updateStatusItemRetur(
      {required String statusItem, required String statusTransaction}) async {
    final data = await ApiService.transactionUpdateStatusReturn(context,
        listIdItem: state.item
            .where((element) => element.status == "OUT")
            .map((e) => e.idProductItem!)
            .toList(),
        idTransaction: state.transaction!.id!,
        statusItem: statusItem,
        statusTransaction: statusTransaction);
    if (data.isSuccess) {
      refreshData();
      showSuccess("Berhasil mengembalikan barang");
    } else {
      showError("Gagal mengembalikan barang");
    }
  }

  void getTransaction() async {
    final detail = await ApiService.getTransactionDetail(context,
        id: params["id_transaction"]);
    if (detail.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success, transaction: detail.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  void getTransactionItem() async {
    final data = await ApiService.getTransactionItem(context,
        id: params["id_transaction"]);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, item: data.data));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  showItemType(ShowItemType showItemType) {
    emit(state.copyWith(showItemType: showItemType));
  }

  getInstalationVehicle() async {
    final data = await ApiService.getInsalationVehicleByIdTransaction(context,
        idTransaction: params["id_transaction"]);
    emit(state.copyWith(listInstalationVehicle: data.data));
  }

  updateTransaction(String status) async {
    final data = await ApiService.transactionUpdateStatus(context,
        idTransaction: state.transaction!.id!, status: status);
    if (data.isSuccess) {
      showSuccess(data.message);
      refreshData();
    } else {
      showError(data.message);
      refreshData();
    }
  }
}

enum ShowItemType { installed, bring }
