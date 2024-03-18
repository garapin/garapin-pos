import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../catalog/view/catalog.dart';
import '../pages/mymerchant.dart';

part 'master_state.dart';
part 'master_cubit.freezed.dart';

class MasterCubit extends BaseCubit<MasterState> {
  MasterCubit(BuildContext context) : super(context, MasterState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() async {}

  void changePage(int index) {
    emit(state.copyWith(index: index, widget: page[index]));
  }

  void showPage(bool status) {
    emit(state.copyWith(showPage: status));
  }

  List<Widget> page = [
    CatalogPage(modeCatalog: ModeCatalog.edit),
    MyMerchantPage(),
    MyMerchantPage(),
  ];
}
