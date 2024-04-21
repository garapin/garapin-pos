import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/cubit/report_cubit.dart';
import 'package:pos/modules/report/view/report.dart';
import 'package:pos/modules/report/view/report_transaction.dart';

import '../../../../data/models/base/store.dart';

part 'master_report_state.dart';
part 'master_report_cubit.freezed.dart';

class MasterReportCubit extends BaseCubit<MasterReportState> {
  MasterReportCubit(BuildContext context) : super(context, MasterReportState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(widget: SizedBox()));
    getStore();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  getStore() async {
    final data = await ApiService.getStoreInfo(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() => initData();

  void changePage(int index) {
    emit(state.copyWith(index: index, widget: page[index]));
  }

  void showPage(bool status) {
    emit(state.copyWith(showPage: status));
  }

  List<Widget> page = [
    BlocProvider(
      create: (context) => ReportCubit(context),
      child: ReportTransaction(),
    ),
    BlocProvider(
      create: (context) => ReportCubit(context),
      child: ReportPage(),
    ),
  ];
}
