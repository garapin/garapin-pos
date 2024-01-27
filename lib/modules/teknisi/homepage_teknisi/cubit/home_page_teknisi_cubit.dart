import 'package:abditrack_inventory/engine/base/base_cubit.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/api/services.dart';
import '../../../../data/models/base/transaction.dart';

part 'home_page_teknisi_state.dart';
part 'home_page_teknisi_cubit.freezed.dart';

class HomePageTeknisiCubit extends BaseCubit<HomePageTeknisiState> {
  HomePageTeknisiCubit(BuildContext context)
      : super(context, HomePageTeknisiState());

  @override
  Future<void> initData({String status = "REQUEST"}) async {
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
