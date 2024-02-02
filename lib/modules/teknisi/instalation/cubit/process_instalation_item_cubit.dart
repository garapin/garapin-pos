import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:armory/data/api/services.dart';
import 'package:armory/data/models/base/transaction_item.dart';
import 'package:armory/engine/engine.dart';
import 'package:armory/engine/helpers/compressed_base64.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../engine/helpers/image_watermark.dart';

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
    locationPermission();
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
    showLoading(message: "Memproses image");
    formKey.currentState!.save();
    String coordinates = await getCurrentLocation();
    List<String> base64ImageList = [];
    for (var i = 0; i < pickedImage.length; i++) {
      File imageFile = File(pickedImage[i].path);

      Uint8List compressedImageBytes = await compressImage(imageFile);

      // Add watermark to compressed image
      String watermarkText =
          "${DateTime.now().toddMMMyyyyHHmm()} \nPemasangan ${formKey.currentState!.value["vehicle_name"]}|${formKey.currentState!.value["vehicle_no"]}\n$coordinates\nVerified Armory";
      Uint8List watermarkedImageBytes =
          await addWatermarkToImage(compressedImageBytes, watermarkText);

/////harus di compress lagi
      String prefix =
          "data:image/${pickedImage[i].path.split(".").last};base64,${base64Encode(watermarkedImageBytes)}";
      base64ImageList.add(prefix);
    }
    dismissLoading();

    emit(state.copyWith(listBase64: base64ImageList));
  }

  doSubmit() async {
    showLoading(message: "Sedang upload image");
    formKey.currentState?.save();
    List<int> listIdTransactionItem =
        state.item.map((cart) => cart.id!).toList();
    List<int> listIdproductItem =
        state.item.map((cart) => cart.idProductItem!).toList();
    final data = await ApiService.instalationVehicleCreate(context,
        instalationImages: state.listBase64,
        idTransactionItem: listIdTransactionItem,
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
    dismissLoading();
  }

  Future<String> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return "${position.latitude} ${position.longitude}";
    } catch (e) {
      return "unknown coordinates";
    }
  }

  locationPermission() async {
    PermissionStatus permission = await Permission.location.request();
    log(permission.name.toString());
    if (permission.isDenied) {
      await Permission.location.request();
      showError("ijin lokasi belum di ijinkan");
      context.pop();
    } else if (permission.isGranted) {}
  }
}
