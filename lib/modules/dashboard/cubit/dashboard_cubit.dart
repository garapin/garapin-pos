import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/master/view/master.dart';
import 'package:pos/modules/dashboard/profile/view/profile.dart';
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

  int showIndex() {
    return state.index;
  }

  List<Widget> page = [
    CatalogPage(
      modeCatalog: ModeCatalog.cashier,
    ),
    BlocProvider(
      create: (context) => CatalogCubit(context),
      child: MasterPage(),
    ),
    // CatalogPage(
    //   modeCatalog: ModeCatalog.edit,
    // ),
    SizedBox(),
    ProfilePage(),
  ];
}
