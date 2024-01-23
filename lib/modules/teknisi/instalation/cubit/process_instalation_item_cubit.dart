import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/data/models/base/transaction_item.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/base/cart.dart';

part 'process_instalation_item_state.dart';
part 'process_instalation_item_cubit.freezed.dart';

class ProcessInstalationItemCubit
    extends BaseCubit<ProcessInstalationItemState> {
  final formKey = GlobalKey<FormBuilderState>();
  final List<TransactionItem> listItem;

  ProcessInstalationItemCubit(BuildContext context, {required this.listItem})
      : super(context, const ProcessInstalationItemState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success, item: listItem));
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  Future<void> pickImage() async {
    try {
      List<XFile> pickedImage = await ImagePicker().pickMultiImage();
      log(pickedImage.length.toString());
      saveImageList(pickedImage);
      emit(state.copyWith(pickedImage: pickedImage));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  saveImageList(List<XFile> pickedImage) async {
    log(pickedImage.toString());
    List<String> base64ImageList = [];
    for (var i = 0; i < pickedImage.length; i++) {
      File imageFile = File(pickedImage[i].path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      var base64Image = base64Encode(imageBytes);
      String prefix =
          "data:image/${pickedImage[i].path.split(".").last};base64,$base64Image}";
      base64ImageList.add(prefix);
    }
    emit(state.copyWith(listBase64: base64ImageList));
  }

  doSubmit() async {
    formKey.currentState!.save();
    List<int> listIdTransactionItem =
        state.item.map((cart) => cart.id!).toList();
    List<int> listIdproductItem =
        state.item.map((cart) => cart.idProductItem!).toList();
    final data = await ApiService.instalationVehicleCreate(context,
        instalationImages: state.listBase64,
        idTransactionItem: listIdTransactionItem,
        idMitra: 1,
        vehicleName: formKey.currentState!.value["vehicle_name"],
        vehicleNo: formKey.currentState!.value["vehicle_no"],
        odoMeter: formKey.currentState!.value["odo_meter"],
        memory: formKey.currentState!.value["memory"],
        idProductItem: listIdproductItem);
    if (data.isSuccess) {
      showSuccess(
          "Berhasil pasang di kendaraan ${formKey.currentState!.value["vehicle_name"]}");
      context.pop();
      context.pop();
    } else {
      showError(data.message);
    }
  }
}
