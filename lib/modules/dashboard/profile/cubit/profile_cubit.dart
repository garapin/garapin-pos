import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/available_payment.dart';
import 'package:pos/data/models/base/bank_account.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/data/models/request/req_bussiness_partner.dart';
import 'package:pos/data/models/request/req_register_bank.dart';
import 'package:pos/engine/engine.dart';
import '../../../../routes/routes.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController addCashierControlerr = TextEditingController();
  ProfileCubit(BuildContext context) : super(context, const ProfileState());

  @override
  Future<void> initData({bool requestBussinessPartner = false}) async {
    loadingState();
    getAvailablePayment();
    final data = await ApiService.getStoreInfo(context);
    if (data.isSuccess) {
      if (requestBussinessPartner == false) {
        setCity(data.data?.store?.city ?? "");
        setAddressState(data.data?.store?.state ?? "");
        setCountry(data.data?.store?.country ?? "");
      }
      emit(state.copyWith(
          status: DataStateStatus.success,
          store: data.data,
          currentVersion: data.currentVersion));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(pickedImage: image));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  getAvailablePayment() async {
    final data = await ApiService.paymentAvailable(context);
    emit(state.copyWith(availablePayment: data.data));
  }

  Future<void> pickNpwpImage(ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(npwpImage: image));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  Future<void> pickNpwpFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        XFile? file = XFile(result.files.single.path!);
        log(file.path);
        emit(state.copyWith(npwpImage: file));
      } else {}
    } catch (e) {
      showError("Gagal memilih file");
    }
  }

  Future<void> pickNibImage(ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(nibImage: image));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  Future<void> pickNibFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        XFile? file = XFile(result.files.single.path!);
        log(file.path);
        emit(state.copyWith(nibImage: file));
      } else {}
    } catch (e) {
      showError("Gagal memilih file");
    }
  }

  Future<void> pickAktaImage(ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      emit(state.copyWith(aktaImage: image));
    } catch (e) {
      showError("Gagal mengambil gambar");
    }
  }

  Future<void> pickAktaFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        XFile? file = XFile(result.files.single.path!);
        log(file.path);
        emit(state.copyWith(aktaImage: file));
      } else {}
    } catch (e) {
      showError("Gagal memilih file");
    }
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData({bool requestBussinessPartner = false}) =>
      initData(requestBussinessPartner: requestBussinessPartner);
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
      final data2 = await ApiService.getStoreInfo(context);
      if (data2.data?.store?.storeName != null) {
        Sessions.setAccountHolder(jsonEncode(data2.data!.store!.accountHolder));
        context.go(RouteNames.dashboard);
      } else {}
    } else {
      showError(data.message);
    }
    refreshData();
    dismissLoading();
    return data;
  }

  void acceptInvitation(String status) async {
    final data = await ApiService.acceptInvitation(context, status: status);
    if (data.isSuccess) {
      showSuccess(data.message);
      refreshData();
    } else {
      showError(data.message);
    }
  }

  bool isReadOnly() {
    if (state.store?.store?.businessPartner?.status == "ACTIVE") {
      return true;
    } else {
      return false;
    }
  }

  Future addBankAccount() async {
    try {
      showLoading();
      formKey.currentState?.save();
      Map<String, dynamic>? form = formKey.currentState?.value;
      final data = await ApiService.addBankAccountInProfile(context,
          req: ReqRegisterBank(
            bankName: form?["bank_name"] ?? "",
            holderName: form?["holder_name"] ?? "",
            accountNumber: int.parse(form?["account_number"]),
            pin: int.parse(form?["pin"]),
          ));
      if (data.isSuccess) {
        final data2 = await ApiService.getStoreInfo(context);
        if (data2.data?.store?.storeName != null) {
          context.go(RouteNames.dashboard);
        } else {}
      } else {
        showError(data.message);
      }
      // refreshData();
      dismissLoading();
      return data;
    } catch (e) {
      return null;
    }
  }

  Future requestBussinessPartner() async {
    showLoading();
    formKey.currentState?.save();
    String? base64Npwp;
    String? base64Nib;
    String? base64IAkta;
    if (state.npwpImage?.path != null) {
      File imageFile = File(state.npwpImage!.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Npwp = base64Encode(imageBytes);
      String prefix =
          "data:image/${state.npwpImage?.path.split(".").last};base64,$base64Npwp}";
      base64Npwp = prefix;
    } else {
      base64Npwp = "";
    }
    if (state.nibImage?.path != null) {
      File imageFile = File(state.nibImage!.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Nib = base64Encode(imageBytes);
      String prefix =
          "data:image/${state.nibImage?.path.split(".").last};base64,$base64Nib}";
      base64Nib = prefix;
    } else {
      base64Nib = "";
    }
    if (state.aktaImage?.path != null) {
      File imageFile = File(state.aktaImage!.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64IAkta = base64Encode(imageBytes);
      String prefix =
          "data:image/${state.aktaImage?.path.split(".").last};base64,$base64IAkta}";
      base64IAkta = prefix;
    } else {
      base64IAkta = "";
    }
    Map<String, dynamic>? form = formKey.currentState?.value;

    final data = await ApiService.requestBussinessPartner(context,
        req: ReqBussinesspartner(
          companyName: form?["company_name"] ?? "",
          noNpwp: form?["no_npwp"] ?? "",
          noNib: form?["no_nib"] ?? "",
          imageNpwp: base64Npwp,
          imageNib: base64Nib,
          imageAkta: base64IAkta,
          status: "PENDING",
        ));
    if (data.isSuccess) {
      showSuccess(data.message);
      final data2 = await ApiService.getStoreInfo(context);
      if (data2.data?.store?.storeName != null) {
        context.go(RouteNames.dashboard);
      } else {}
    } else {
      showError(data.message);
    }
    refreshData(requestBussinessPartner: true);
    dismissLoading();
    return data;
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

  showFormBussinessPartner() {
    emit(state.copyWith(
        showFormBussinessPartner:
            state.showFormBussinessPartner ? false : true));
  }
}
