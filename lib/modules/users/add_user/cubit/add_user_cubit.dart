import 'package:armory/data/api/services.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'add_user_state.dart';
part 'add_user_cubit.freezed.dart';

class AddUserCubit extends BaseCubit<AddUserState> {
  final formKey = GlobalKey<FormBuilderState>();
  AddUserCubit(BuildContext context) : super(context, AddUserState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  cretaeAccount() async {
    formKey.currentState!.save();
    final data = await ApiService.createUser(context,
        params: formKey.currentState!.value);
    if (data.isSuccess) {
      showSuccess(data.message);
      context.pop();
    } else {
      showError(data.message);
    }
  }
}
