import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

import '../../../../../engine/base/base_cubit.dart';

part 'my_merchant_state.dart';
part 'my_merchant_cubit.freezed.dart';

class MyMerchantCubit extends BaseCubit<MyMerchantState> {
  final formKey = GlobalKey<FormBuilderState>();
  MyMerchantCubit(BuildContext context) : super(context, MyMerchantState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() {
    emit(state.copyWith(status: DataStateStatus.initial));
  }

  @override
  Future<void> refreshData() => initData();

  void createMerchant() async {
    showLoading();
    formKey.currentState?.save();
    Map<String, dynamic>? form = formKey.currentState?.value;
    final data = await ApiService.createMerchant(context,
        databaseName: form?["store_name"] ?? "",
        merchantRole: form?["merchant_role"] ?? "",
        email: form?["email"] ?? "");
    if (data.isSuccess) {
      form?["store_name"] = "";
      form?["merchant_role"] = "";
      form?["email"] = "";
      formKey.currentState?.save();
      refreshData();
      showSuccess(data.message);
    } else {
      showError(data.message);
    }
    dismissLoading();
  }
}
