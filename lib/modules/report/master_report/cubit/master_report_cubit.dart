import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/cubit/report_cubit.dart';
import 'package:pos/modules/report/cubit/report_transaction_cubit.dart';
import 'package:pos/modules/report/refactor_cubit/report_transaction_bagi_bagi_cubit.dart';
import 'package:pos/modules/report/refactor_cubit/report_transaction_cubit.dart' as refc_report;
import 'package:pos/modules/report/refactor_cubit/report_transaction_by_payment_method_cubit.dart' as refc_report_paymennt;
import 'package:pos/modules/report/refactor_cubit/report_transaction_by_product_cubit.dart';
import 'package:pos/modules/report/refactor_view/report_transaction_bagi_bagi_page.dart';
import 'package:pos/modules/report/refactor_view/report_transaction_by_product_page.dart';
import 'package:pos/modules/report/refactor_view/report_transaction_page.dart';
import 'package:pos/modules/report/refactor_view/report_transaction_payment_method_page.dart';
import 'package:pos/modules/report/view/report.dart';
import 'package:pos/modules/report/view/report_transaction.dart';

import '../../../../data/models/base/store.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';

part 'master_report_state.dart';
part 'master_report_cubit.freezed.dart';

class MasterReportCubit extends BaseCubit<MasterReportState> {
  MasterReportCubit(BuildContext context)
      : super(context, const MasterReportState());

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
      create: (context) => refc_report.ReportTransactionCubit(context),
      child: const ReportTransactionPage(),
    ),
    BlocProvider(
      create: (context) => refc_report_paymennt.ReportTransactionByPaymentMethodCubit(context),
      child: const ReportTransactionPaymentMethodPage(),
    ),
    BlocProvider(
      create: (context) => ReportTransactionByProductCubit(context),
      child: const ReportTransactionByProductPage(),
    ),
    BlocProvider(
      create: (context) => ReportTransactionBagiBagiCubit(context),
      child: const ReportTransactionBagiBagiPage(),
    ),
  ];
  Widget showMaster() {
    if (state.store == null) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          children: [
            (state.store?.store?.merChantRole == "SUPP")
                ? const SizedBox()
                : CustomButton(
              onPressed: () {
                showPage(false);
                changePage(0);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.appColor.primary.withOpacity(0.15),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    "Report Transaction",
                    style: AppFont.largePrimary(context),
                  ),
                ),
              ),
            ),
            (state.store?.store?.merChantRole == "SUPP") ? const SizedBox() : const SizedBox(height: 20),
            (state.store?.store?.merChantRole == "SUPP")
                ? const SizedBox()
                : CustomButton(
              onPressed: () {
                showPage(false);
                changePage(1);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.appColor.primary.withOpacity(0.15),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    "Report Transaction by Payment Method",
                    style: AppFont.largePrimary(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            (state.store?.store?.merChantRole == "SUPP") ? const SizedBox() : const SizedBox(height: 20),
            (state.store?.store?.merChantRole == "SUPP")
                ? const SizedBox()
                : CustomButton(
              onPressed: () {
                showPage(false);
                changePage(2);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.appColor.primary.withOpacity(0.15),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    "Report Transaction by Product",
                    style: AppFont.largePrimary(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            (state.store?.store?.merChantRole == "SUPP")
                ? const SizedBox()
                : const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                showPage(false);
                changePage(3);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.appColor.primary.withOpacity(0.15),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    "Report Bagi-Bagi",
                    style: AppFont.largePrimary(context),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
  }
}
