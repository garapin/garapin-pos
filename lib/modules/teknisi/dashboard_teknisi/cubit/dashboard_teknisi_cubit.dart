import 'dart:developer';
import 'package:abditrack_inventory/modules/cart/view/cart.dart';
import 'package:abditrack_inventory/modules/catalog/view/catalog.dart';
import 'package:abditrack_inventory/modules/profile/view/profile.dart';
import 'package:abditrack_inventory/modules/transaction/list_transaction/view/list_transaction.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../engine/base/base_cubit.dart';
import '../../../homepage/home_page.dart';
import '../../transaction/list_transaction/view/list_transaction_teknisi.dart';

part 'dashboard_teknisi_state.dart';

part 'dashboard_teknisi_cubit.freezed.dart';

class DashboardTeknisiCubit extends BaseCubit<DashboardTeknisiState> {
  final bucket = PageStorageBucket();

  DashboardTeknisiCubit(BuildContext context)
      : super(
          context,
          const DashboardTeknisiState(currentScreen: HomePage(), currentTab: 0),
        );

  void onClickProduct() {}

  void changeTab(int index) {
    log('Change Tab $index');
    if (state.currentTab != index) {
      emit(state.copyWith(currentScreen: listScreen[index], currentTab: index));
    }
  }

  @override
  Future<void> initData() async {}

  @override
  void loadingState() {}

  @override
  Future<void> refreshData() async {}

  final listScreen = [
    const HomePage(),
    ListTransactionTeknisiPage(),
    ProfilePage()
  ];
}
