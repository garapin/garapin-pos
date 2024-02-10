import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  final formKey = GlobalKey<FormBuilderState>();
  ProfileCubit(BuildContext context) : super(context, ProfileState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.getStoreInfo(context);

    if (data.isSuccess) {
      var store = data.data?.store;
      formKey.currentState?.value["name_store"] = store?.storeName ?? "";
      formKey.currentState?.value["pic"] = store?.picName ?? "";
      formKey.currentState?.value["no_telepon"] = store?.noTelepon ?? "";
      formKey.currentState?.value["postcal_code"] = store?.picName ?? "";
      formKey.currentState?.value["postcal_code"] = store?.picName ?? "";
      formKey.currentState?.value["postcal_code"] = store?.picName ?? "";
      formKey.currentState?.save();
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
