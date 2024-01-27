import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../data/api/services.dart';
import '../../../data/models/base/cart.dart';
import '../../../data/models/base/rules_scan.dart';
import '../../../engine/base/base_cubit.dart';
import '../../../engine/helpers/options.dart';
import '../../add_product/cubit/add_product_cubit.dart';

part 'add_to_cart_state.dart';
part 'add_to_cart_cubit.freezed.dart';

class AddToCartCubit extends BaseCubit<AddToCartState> {
  MobileScannerController cameraController = MobileScannerController();
  AddToCartCubit(BuildContext context) : super(context, AddToCartState());

  @override
  Future<void> initData() async {
    loadingState();
    getCart();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void doSubmit() async {
    showLoading();
    final data = await ApiService.addToCart(context,
        imei: (state.rulesScan?.scanImei == "YES") ? state.imei : "",
        noSn: (state.rulesScan?.scanSn == "YES") ? state.noSn : "",
        noProduct: state.noProduct);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
    getCart();
    finishRefresh(state.status);
  }

  void doScanv2(String result) {
    // if (state.typeScan == null) {
    //   showError("Pilih Scan dahulu");
    // } else {
    if (state.typeScan == TypeScan.imei) {
      emit(state.copyWith(imei: result));
    } else if (state.typeScan == TypeScan.noProduct) {
      emit(state.copyWith(noProduct: result));
    } else if (state.typeScan == TypeScan.sn) {
      emit(state.copyWith(noSn: result));
    }
    // }
  }

  void changeTypeScan(TypeScan typeScan) {
    emit(state.copyWith(typeScan: typeScan));
  }

  void checkRulesScan(String codeProduct) async {
    final data = await ApiService.checkRulesScanProduct(context,
        codeProduct: codeProduct);
    if (data.isSuccess) {
      emit(state.copyWith(rulesScan: data.data));
      // showSuccess(
      //     "rules scan produk ini imei ${data.data?.scanImei} dan sn ${data.data?.scanSn}");
    } else {
      emit(
          state.copyWith(rulesScan: RulesScan(scanImei: "YES", scanSn: "YES")));
      // showError("rules tidak ditemukan, isi imei dan sn");
    }
  }

  void getCart() async {
    final data = await ApiService.cartById(context);
    if (data.isSuccess) {
      emit(state.copyWith(cart: data.data));
    } else {}
  }
}
