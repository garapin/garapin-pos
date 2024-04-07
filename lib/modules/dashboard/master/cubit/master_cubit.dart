import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/catalog/cubit/catalog_cubit.dart';
import 'package:pos/modules/dashboard/master/pages/bagi/view/bagi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/models/base/store.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../catalog/view/catalog.dart';
import '../pages/mymerchant.dart';

part 'master_state.dart';
part 'master_cubit.freezed.dart';

class MasterCubit extends BaseCubit<MasterState> {
  MasterCubit(BuildContext context) : super(context, MasterState());

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
    CatalogPage(modeCatalog: ModeCatalog.edit),
    MyMerchantPage(),
    BagiPage(),
  ];

  Widget showRulesWidgetMaster() {
    if (state.store?.store?.storeType == "USER") {
      return Column(children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  showPage(false);
                },
                icon: Icon(Icons.close))),
        CustomButton(
            onPressed: () {
              changePage(0);
              showPage(false);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.appColor.primary.withOpacity(0.15)),
              height: 40,
              child: Center(
                  child: Text(
                "Product",
                style: AppFont.largePrimary(context),
              )),
            )),
        SizedBox(height: 20)
      ]);
    } else if (state.store?.store?.storeType == "BUSSINESS_PARTNER") {
      return Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    showPage(false);
                  },
                  icon: Icon(Icons.close))),
          CustomButton(
              onPressed: () {
                changePage(1);
                showPage(false);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColor.appColor.primary.withOpacity(0.15)),
                height: 40,
                child: Center(
                    child: Text(
                  "My Merchant",
                  style: AppFont.largePrimary(context),
                )),
              )),
          SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                changePage(2);
                showPage(false);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColor.appColor.primary.withOpacity(0.15)),
                height: 40,
                child: Center(
                    child: Text(
                  "Bagi - Bagi",
                  style: AppFont.largePrimary(context),
                )),
              ))
        ],
      );
    } else if (state.store?.store?.storeType == "MERCHANT") {
      if (state.store?.store?.merChantRole == "TRX") {
        return Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    showPage(false);
                  },
                  icon: Icon(Icons.close))),
          CustomButton(
              onPressed: () {
                changePage(0);
                showPage(false);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColor.appColor.primary.withOpacity(0.15)),
                height: 40,
                child: Center(
                    child: Text(
                  "Product",
                  style: AppFont.largePrimary(context),
                )),
              ))
        ]);
      } else if (state.store?.store?.merChantRole == "SUPP") {
        return Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      showPage(false);
                    },
                    icon: Icon(Icons.close))),
            CustomButton(
                onPressed: () {
                  changePage(0);
                  showPage(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.15)),
                  height: 40,
                  child: Center(
                      child: Text(
                    "Product",
                    style: AppFont.largePrimary(context),
                  )),
                )),
            SizedBox(height: 20),
            CustomButton(
                onPressed: () {
                  changePage(1);
                  showPage(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.15)),
                  height: 40,
                  child: Center(
                      child: Text(
                    "My Merchant",
                    style: AppFont.largePrimary(context),
                  )),
                )),
            SizedBox(height: 20),
            CustomButton(
                onPressed: () {
                  changePage(2);
                  showPage(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.15)),
                  height: 40,
                  child: Center(
                      child: Text(
                    "Bagi - Bagi",
                    style: AppFont.largePrimary(context),
                  )),
                ))
          ],
        );
      } else if (state.store?.store?.merChantRole == "CUST") {
        return Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      showPage(false);
                    },
                    icon: Icon(Icons.close))),
            CustomButton(
                onPressed: () {
                  changePage(0);
                  showPage(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.15)),
                  height: 40,
                  child: Center(
                      child: Text(
                    "Product",
                    style: AppFont.largePrimary(context),
                  )),
                )),
            SizedBox(height: 20),
            CustomButton(
                onPressed: () {
                  changePage(1);
                  showPage(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.15)),
                  height: 40,
                  child: Center(
                      child: Text(
                    "My Merchant",
                    style: AppFont.largePrimary(context),
                  )),
                )),
            SizedBox(height: 20),
            CustomButton(
                onPressed: () {
                  changePage(2);
                  showPage(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.appColor.primary.withOpacity(0.15)),
                  height: 40,
                  child: Center(
                      child: Text(
                    "Bagi - Bagi",
                    style: AppFont.largePrimary(context),
                  )),
                ))
          ],
        );
      } else {
        return Text(state.store?.store?.storeType ?? "");
      }
    } else {
      return Text(state.store?.store?.storeType ?? "");
    }
  }
}
