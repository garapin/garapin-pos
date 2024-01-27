import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

part 'create_product_state.dart';
part 'create_product_cubit.freezed.dart';

class CreateProductCubit extends BaseCubit<CreateProductState> {
  final formKey = GlobalKey<FormBuilderState>();
  CreateProductCubit(BuildContext context)
      : super(context, const CreateProductState());

  @override
  Future<void> initData() async {
    loadingState();
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
    final data = await ApiService.addProduct(context,
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
            : "NO");
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
