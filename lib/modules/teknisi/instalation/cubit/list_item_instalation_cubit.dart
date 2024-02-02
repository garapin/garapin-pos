import 'dart:developer';
import 'package:armory/data/models/base/transaction_item.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/api/services.dart';
import '../../../../data/models/base/cart.dart';

part 'list_item_instalation_state.dart';
part 'list_item_instalation_cubit.freezed.dart';

class ListItemInstalationCubit extends BaseCubit<ListItemInstalationState> {
  final int idTransaction;
  ListItemInstalationCubit(BuildContext context, {required this.idTransaction})
      : super(context, ListItemInstalationState());

  @override
  Future<void> initData() async {
    loadingState();
    getTransactionItem();
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));
  @override
  Future<void> refreshData() => initData();

  void getTransactionItem() async {
    final data =
        await ApiService.getTransactionItem(context, id: idTransaction);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, item: data.data));
    }
    finishRefresh(state.status);
  }

  void selectedItem(TransactionItem itemId) {
    List<TransactionItem> selected =
        List<TransactionItem>.from(state.selectedItem);
    if (selected.contains(itemId)) {
      selected.remove(itemId);
      emit(state.copyWith(selectedItem: selected));
    } else {
      selected.add(itemId);
      emit(state.copyWith(selectedItem: selected));
    }
    log(selected.map((e) => e.noProduct).toList().toString());
  }

  List<TransactionItem> sendSelectedListCart() {
    return state.selectedItem;
  }
}
