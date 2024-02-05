import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../catalog/view/catalog.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends BaseCubit<DashboardState> {
  DashboardCubit(BuildContext context)
      : super(context, DashboardState(index: 0));

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(
        status: DataStateStatus.success, widget: CatalogPage(), index: 0));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));
  @override
  Future<void> refreshData() async {}

  changePage(int index) {
    loadingState();
    emit(state.copyWith(
        status: DataStateStatus.success, widget: page[index], index: index));
  }

  List<Widget> page = [
    CatalogPage(),
    SizedBox(),
    SizedBox(),
  ];
}
