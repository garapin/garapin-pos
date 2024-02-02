import 'dart:developer';
import 'package:armory/modules/cart/view/cart.dart';
import 'package:armory/modules/catalog/view/catalog.dart';
import 'package:armory/modules/profile/view/profile.dart';
import 'package:armory/modules/transaction/list_transaction/view/list_transaction.dart';
import 'package:flutter/material.dart';
import '../../../engine/base/base_cubit.dart';
import '../../homepage/home_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends BaseCubit<DashboardState> {
  final bucket = PageStorageBucket();

  DashboardCubit(BuildContext context)
      : super(
          context,
          const DashboardState(currentScreen: HomePage(), currentTab: 0),
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
    CatalogPage(),
    CartPage(),
    ListTransactionPage(),
    ProfilePage()
  ];
}
