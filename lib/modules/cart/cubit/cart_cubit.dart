import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:abditrack_inventory/data/models/base/cart.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../data/api/services.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends BaseCubit<CartState> {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  List<String> listSelected = [];
  CartCubit(BuildContext context) : super(context, CartState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.cartById(context, id: "1");
    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(status: DataStateStatus.empty));
      } else {
        emit(state.copyWith(status: DataStateStatus.success, cart: data.data));
      }
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void doTransaction() async {
    if (signaturePadKey.currentState!.toPathList().isEmpty) {
      showError("Belum Tanda Tangan");
    } else {
      await createSignature().then((value) async {
        final data = await ApiService.addTransaction(context,
            transactionPurpose: "test transaksi",
            base64: value,
            notes: "test",
            idProductDetail: state.selectedItem);
        if (data.isSuccess) {
          initData();
          showSuccess(data.message);
        } else {
          showError(data.message);
        }
      });
    }
  }

  Future<String> createSignature() async {
    ui.Image image = await signaturePadKey.currentState!.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    // Convert ByteData to Uint8List
    Uint8List uint8List = byteData!.buffer.asUint8List();

    // Encode Uint8List to base64
    String base64String = base64Encode(uint8List);

    return "data:image/png;base64,$base64String";
  }

  void selectedItem(String itemId) {
    List<String> selected = List.from(state.selectedItem);
    if (selected.contains(itemId)) {
      selected.remove(itemId);
      emit(state.copyWith(selectedItem: selected));
    } else {
      selected.add(itemId);
      emit(state.copyWith(selectedItem: selected));
    }

    log(selected.toList().toString());
  }
}
