import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import '../../../../../data/models/base/database_store.dart';
import '../../cubit/master_cubit.dart';

part 'my_merchant_state.dart';
part 'my_merchant_cubit.freezed.dart';

class MyMerchantCubit extends BaseCubit<MyMerchantState> {
  final formKey = GlobalKey<FormBuilderState>();
  MyMerchantCubit(BuildContext context)
      : super(context, const MyMerchantState());

  @override
  Future<void> initData() async {
    loadingState();
    getAllMerhcant();
    getStore();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() async {
    initData();
  }

  getStore() async {
    final data = await ApiService.getStoreInfo(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  void getAllMerhcant() async {
    final data = await ApiService.getStoreDatabaseByParent(context);
    if (data.isSuccess) {
      emit(state.copyWith(merchants: data.data));
    }
  }

  void createMerchant(GlobalKey<FormBuilderState> formData) async {
    showLoading();
    formKey.currentState?.save();
    Map<String, dynamic>? form = formKey.currentState?.value;
    final data = await ApiService.createMerchant(context,
        databaseName: form?["store_name"] ?? "",
        merchantRole: form?["merchant_role"] ?? "",
        email: form?["email"] ?? "");
    if (data.isSuccess) {
      formData.currentState?.reset();
      formData.currentState?.patchValue({"merchant_role": null});
      refreshData();
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
  }
}
