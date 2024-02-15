import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController addCashierControlerr = TextEditingController();
  ProfileCubit(BuildContext context) : super(context, const ProfileState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.getStoreInfo(context);

    if (data.isSuccess) {
      setCity(data.data?.store?.city ?? "");
      setAddressState(data.data?.store?.state ?? "");
      setCountry(data.data?.store?.country ?? "");
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(pickedImage: image));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
  setCountry(String country) {
    emit(state.copyWith(country: country));
  }

  setAddressState(String addressState) {
    emit(state.copyWith(stateAddress: addressState));
  }

  setCity(String city) {
    emit(state.copyWith(city: city));
  }

  Future updateProfile() async {
    showLoading();
    formKey.currentState?.save();
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
    Map<String, dynamic>? form = formKey.currentState?.value;
    final data = await ApiService.updateProfile(context,
        storeName: form?["name_store"] ?? "",
        picName: form?["pic"] ?? "",
        phonenumber: form?["no_telepon"] ?? "",
        address: form?["address"] ?? "",
        city: state.city ?? "",
        country: state.country ?? "",
        stateAddress: state.stateAddress ?? "",
        postalCode: form?["postcal_code"] ?? "",
        base64: base64Image);
    if (data.isSuccess) {
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    refreshData();
    dismissLoading();
  }

  addCashier() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Kasir'),
          content: TextField(
            controller: addCashierControlerr,
            decoration: const InputDecoration(hintText: 'Masukan Email'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await ApiService.regiterCashier(context,
                    email: addCashierControlerr.text);
                if (data.isSuccess) {
                  context.pop();
                  refreshData();
                  showSuccess(data.message);
                } else {
                  context.pop();
                  showError(data.message);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  removeCashier(
      {required String email,
      required String idUser,
      required String idDatabase}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus kasir $email'),
          content:
              Text("Anda yakin untuk menghapus kasir dengan email $email?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await ApiService.removeCashier(context,
                    idUser: idUser, idDatabaseName: idDatabase);
                if (data.isSuccess) {
                  context.pop();
                  refreshData();
                  showSuccess(data.message);
                } else {
                  context.pop();
                  showError(data.message);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
