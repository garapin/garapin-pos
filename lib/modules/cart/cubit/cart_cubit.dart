import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:armory/data/models/base/cart.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../data/api/services.dart';
import '../../../data/models/base/mitra.dart';
import '../../../data/models/base/user.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends BaseCubit<CartState> {
  final formKey = GlobalKey<FormBuilderState>();
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  List<String> listSelected = [];
  CartCubit(BuildContext context) : super(context, CartState());

  @override
  Future<void> initData() async {
    loadingState();
    getAllMitra();
    final data = await ApiService.cartById(context);
    final user = await ApiService.getUsers(context);

    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(status: DataStateStatus.empty));
      } else {
        emit(state.copyWith(
            status: DataStateStatus.success,
            cart: data.data,
            users: user.data));
      }
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  getAllMitra() async {
    final data = await ApiService.allMitra(context);
    emit(state.copyWith(listMitra: data.data));
  }

  selectedListTeknisi(List<ValueItem> value) {
    emit(state.copyWith(selectedOptions: value));
    log(state.selectedOptions.toString());
  }

  selectedMitra(int mitra) {
    emit(state.copyWith(selectedMitra: mitra));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void doTransaction() async {
    formKey.currentState!.save();
    List<int> selectedTeknisi = state.selectedOptions
        .map((item) => int.parse(item.value.toString()))
        .toList();

    if (signaturePadKey.currentState!.toPathList().isEmpty) {
      showError("Belum Tanda Tangan");
    } else {
      await createSignature().then((value) async {
        final data = await ApiService.addTransaction(context,
            transactionPurpose:
                formKey.currentState?.value["transaction_purpose"],
            base64: value,
            notes: formKey.currentState?.value["notes"],
            listTeknisi: selectedTeknisi,
            idProductItem: state.selectedItem,
            idMitra: state.selectedMitra!);
        if (data.isSuccess) {
          initData();
          showSuccess(data.message);
        } else {
          emit(state.copyWith(err: data.message));
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
