import 'dart:convert';

import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/routes.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final formKey = GlobalKey<FormBuilderState>();
  LoginCubit(BuildContext context) : super(context, LoginState());

  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  void doLogin() async {
    showLoading();
    final data = await ApiService.login(context,
        email: formKey.currentState!.value["email"],
        password: formKey.currentState!.value["password"]);
    if (data.isSuccess) {
      Sessions.setUsers(jsonEncode(data.data!))
          .then((value) => context.goNamed(RouteNames.root));
    } else {
      emit(state.copyWith(status: DataStateStatus.success));
      showError(data.message);
    }
    dismissLoading();
    finishRefresh(state.status);
  }
}
