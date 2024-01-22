import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/data/models/base/product.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'add_product_state.dart';
part 'add_product_cubit.freezed.dart';

class AddProductCubit extends BaseCubit<AddProductState> {
  MobileScannerController cameraController = MobileScannerController();
  AddProductCubit(BuildContext context)
      : super(context, const AddProductState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void doSubmit() async {
    showLoading();
    final data = await ApiService.addItem(context,
        imei: state.imei, noSn: state.noSn, noProduct: state.noProduct);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
    finishRefresh(state.status);
  }

  void doScanv2(String result) {
    if (state.typeScan == null) {
      showError("Pilih Scan dahulu");
    } else {
      if (state.typeScan == TypeScan.imei) {
        emit(state.copyWith(imei: result));
      } else if (state.typeScan == TypeScan.noProduct) {
        emit(state.copyWith(noProduct: result));
      } else if (state.typeScan == TypeScan.sn) {
        emit(state.copyWith(noSn: result));
      }
    }
  }

  void changeTypeScan(TypeScan typeScan) {
    emit(state.copyWith(typeScan: typeScan));
  }
}
