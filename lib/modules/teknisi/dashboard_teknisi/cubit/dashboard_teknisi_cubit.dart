import 'dart:developer';
import 'package:armory/modules/profile/view/profile.dart';
import 'package:armory/modules/teknisi/homepage_teknisi/view/homepage_teknisi.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../engine/base/base_cubit.dart';
import '../../transaction/list_transaction/view/list_transaction_teknisi.dart';

part 'dashboard_teknisi_state.dart';
part 'dashboard_teknisi_cubit.freezed.dart';

class DashboardTeknisiCubit extends BaseCubit<DashboardTeknisiState> {
  final bucket = PageStorageBucket();

  DashboardTeknisiCubit(BuildContext context)
      : super(
          context,
          const DashboardTeknisiState(
              currentScreen: HomePageTeknisiPage(), currentTab: 0),
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
    HomePageTeknisiPage(),
    ListTransactionTeknisiPage(),
    ProfilePage()
  ];
}
