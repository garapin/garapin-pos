import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../data/models/base/user.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit(BuildContext context) : super(context, ProfileState());

  @override
  Future<void> initData() async {
    loadingState();
    getVersion();
    final data = await ApiService.getUserId(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, user: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error, err: data.message));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();

  getVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    emit(state.copyWith(version: "${info.version}+${info.buildNumber}"));
  }
}
