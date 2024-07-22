import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/amount_pending_transaction.dart';
import 'package:pos/data/models/base/available_payment.dart';
import 'package:pos/data/models/base/qrcode.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/data/models/base/virtual_account.dart';
import 'package:pos/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/cubit/create_bagi_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/cubit/my_merchant_cubit.dart';
import 'package:pos/modules/dashboard/master/view/master.dart';
import 'package:pos/modules/dashboard/profile/cubit/profile_cubit.dart';
import 'package:pos/modules/dashboard/profile/view/profile.dart';
import 'package:pos/modules/dashboard/withdrawl/cubit/withdrawl_cubit.dart';
import 'package:pos/modules/dashboard/withdrawl/view/withdrawl.dart';
import 'package:pos/modules/history_transaction/view/historyTransaction.dart';
import 'package:pos/modules/report/cubit/report_cubit.dart';
import 'package:pos/modules/report/master_report/view/master_report.dart';
import '../../../data/models/base/store.dart';
import '../catalog/view/catalog.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends BaseCubit<DashboardState> {
  DashboardCubit(BuildContext context) : super(context, const DashboardState());

  @override
  Future<void> initData() async {
    loadingState();
    getStore();
    getAmountPendingTransaction();
    context.read<ProfileCubit>().initData();
    emit(state.copyWith(status: DataStateStatus.success, widget: page[3]));
    finishRefresh(state.status);
  }

  getAmountPendingTransaction() async {
    Timer.periodic(const Duration(minutes: 2), (timer) async {
      final data = await ApiService.getAmountPending(
        context,
      );
      if (data.isSuccess) {
        if (data.data!.amount! > 0) {
          Sessions.setPayedQuickRelease(false);
        } else {
          Sessions.setPayedQuickRelease(true);
        }

        emit(state.copyWith(amountPendingTransaction: data.data));
      }
    });
  }

  getStore() async {
    loadingState();
    final data = await ApiService.getStoreInfo(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() async {}

  changePage(int index) {
    loadingState();
    emit(state.copyWith(
        status: DataStateStatus.success, widget: page[index], index: index));
  }

  int showIndex() {
    return state.index;
  }

  List<Widget> page = [
    const CatalogPage(
      modeCatalog: ModeCatalog.cashier,
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BagiCubit(context)),
        BlocProvider(create: (context) => CatalogCubit(context)),
        BlocProvider(create: (context) => MyMerchantCubit(context)),
      ],
      child: MasterPage(),
    ),
    // CatalogPage(
    //   modeCatalog: ModeCatalog.edit,
    // ),
    // MultiBlocProvider(providers: [
    //   BlocProvider(
    //     create: (context) => ReportCubit(context),
    //   ),
    //   BlocProvider(
    //     create: (context) => ReportDetailCubit(context, {}),
    //   ),
    //   BlocProvider(
    //     create: (context) => DetailTransactionProductCubit(context, {}),
    //   ),
    // ], child: ReportPage()),
    MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => MasterReportCubit(context),
        // ),
        BlocProvider(
          create: (context) => ReportCubit(context),
        ),
      ],
      child: MasterReportPage(),
    ),
    ProfilePage(),
    HistoryTransactionPage(),
    BlocProvider(
      create: (context) => WithdrawlCubit(context),
      child: WithdrawlPage(),
    )
  ];
}
