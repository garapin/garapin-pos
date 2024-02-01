import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'add_customer_state.dart';
part 'add_customer_cubit.freezed.dart';

class AddCustomerCubit extends BaseCubit<AddCustomerState> {
  final formKey = GlobalKey<FormBuilderState>();
  AddCustomerCubit(BuildContext context)
      : super(context, const AddCustomerState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  doSubmit() async {
    showLoading();
    final data = await ApiService.addCustomer(context,
        name: formKey.currentState?.value["name"],
        fullName: formKey.currentState?.value["full_name"],
        address: formKey.currentState?.value["address"]);

    if (data.isSuccess) {
      showSuccess(data.message);
      context.pop();
    } else {
      showError(data.message);
    }
    dismissLoading();
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
