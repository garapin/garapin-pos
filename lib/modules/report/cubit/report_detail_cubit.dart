import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/split_payment_detail.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

import '../../../data/models/base/invoices.dart';
import '../../../data/models/base/store.dart';
import '../../../engine/base/base_cubit.dart';
import '../../../routes/routes.dart';

part 'report_detail_state.dart';
part 'report_detail_cubit.freezed.dart';

class ReportDetailCubit extends BaseCubit<ReportDetailState> {
  final Map<String, String> args;

  ReportDetailCubit(BuildContext context, this.args)
      : super(context, ReportDetailState());

  @override
  Future<void> initData() async {
    loadingState();
    getInvoice();
    getStore();
    final data = await ApiService.reportDetailBagi(context,
        invoice: args["invoice"]!, targetDatabase: args["database"]!);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, split: data.data));
    } else {
      if (data.message == "NON_SPLIT") {
        print("Pindaj");
        context.replaceNamed(RouteNames.detailTransactionProduct,
            extra: Map<String, String>.from(
                {"database": args["database"], "invoice": args["invoice"]}));
      }
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  getStore() async {
    final data = await ApiService.getStoreInfo(context);
    emit(state.copyWith(store: data.data));
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
