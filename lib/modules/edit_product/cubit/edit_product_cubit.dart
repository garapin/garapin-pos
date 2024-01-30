import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/data/models/base/product.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_product_state.dart';
part 'edit_product_cubit.freezed.dart';

class EditProductCubit extends BaseCubit<EditProductState> {
  final int idProduct;
  final formKey = GlobalKey<FormBuilderState>();
  EditProductCubit(BuildContext context, this.idProduct)
      : super(context, const EditProductState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.singleProduct(context, id: idProduct);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, product: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error, err: data.message));
    }
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  Future<void> pickImage(ImageSource source) async {
    try {
      XFile? pickedImage = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(pickedImage: pickedImage));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  void doSave() async {
    showLoading();
    String? base64Image;
    if (state.pickedImage?.path != null) {
      File imageFile = File(state.pickedImage!.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      String prefix =
          "data:image/${state.pickedImage?.path.split(".").last};base64,$base64Image}";
      base64Image = prefix;
    } else {
      base64Image = "";
    }
    log(base64Image);
    final data = await ApiService.editProduct(context,
        name: formKey.currentState?.value['name'] ?? "",
        codeProduct: formKey.currentState?.value['code_product'] ?? "",
        desc: formKey.currentState?.value['description'] ?? "",
        base64: base64Image,
        scanImei:
            (formKey.currentState!.value["scan_imei"].toString() == "true")
                ? "YES"
                : "NO",
        scanSn: (formKey.currentState!.value["scan_sn"].toString() == "true")
            ? "YES"
            : "NO",
        id: idProduct);
    if (data.isSuccess) {
      context.pop();
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
    finishRefresh(state.status);
  }
}
