import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/merchant_model.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

import '../../../../../data/models/base/database_store.dart';
import '../../../../../engine/base/base_cubit.dart';

part 'my_merchant_state.dart';
part 'my_merchant_cubit.freezed.dart';

class MyMerchantCubit extends BaseCubit<MyMerchantState> {
  final formKey = GlobalKey<FormBuilderState>();
  MyMerchantCubit(BuildContext context) : super(context, MyMerchantState());

  @override
  Future<void> initData() async {
    loadingState();
    getAllMerhcant();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() => initData();

  void getAllMerhcant() async {
    final data = await ApiService.getStoreDatabaseByParent(context);
    if (data.isSuccess) {
      emit(state.copyWith(merchants: data.data));
    }
  }

  void createMerchant() async {
    showLoading();
    formKey.currentState?.save();
    Map<String, dynamic>? form = formKey.currentState?.value;
    final data = await ApiService.createMerchant(context,
        databaseName: form?["store_name"] ?? "",
        merchantRole: form?["merchant_role"] ?? "",
        email: form?["email"] ?? "");
    if (data.isSuccess) {
      formKey.currentState?.reset();
      refreshData();
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
  }
}
