import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/base/vehicle.dart';

part 'list_vehicle_installed_state.dart';
part 'list_vehicle_installed_cubit.freezed.dart';

class ListVehicleInstalledCubit extends BaseCubit<ListVehicleInstalledState> {
  ListVehicleInstalledCubit(BuildContext context)
      : super(context, const ListVehicleInstalledState());

  @override
  Future<void> initData() async {
    loadingState();
    final data = await ApiService.listInsatalledVehicle(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, vehicle: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error, err: data.message));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
