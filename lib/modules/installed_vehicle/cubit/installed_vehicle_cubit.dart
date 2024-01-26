import 'package:abditrack_inventory/data/api/response.dart';
import 'package:abditrack_inventory/data/api/services.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/base/instalation_vehicle.dart';
import '../../../engine/base/base_cubit.dart';

part 'installed_vehicle_state.dart';
part 'installed_vehicle_cubit.freezed.dart';

enum TypeInstalledBy { vehicleNo, idProductItem }

class InstalledVehicleCubit extends BaseCubit<InstalledVehicleState> {
  final Map<String, dynamic> params;
  InstalledVehicleCubit(BuildContext context, this.params)
      : super(context, const InstalledVehicleState());

  @override
  Future<void> initData() async {
    loadingState();
    final ApiResponseList<InstalationVehicle> data;
    if (params["type"] == TypeInstalledBy.vehicleNo) {
      data = await ApiService.getInsalationVehicleByVehicleNo(context,
          vehicleNo: int.parse(params["id"]));
    } else {
      data = await ApiService.getInsalationVehicleByItemId(context,
          idProductItem: params["id"]);
    }

    if (data.isSuccess) {
      if (data.data.isEmpty) {
        emit(state.copyWith(
            status: DataStateStatus.empty, instalationVehicle: data.data));
      } else {
        emit(state.copyWith(
            status: DataStateStatus.success, instalationVehicle: data.data));
      }
    } else {
      emit(state.copyWith(
          status: DataStateStatus.error, instalationVehicle: data.data));
    }
    finishRefresh(state.status);
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
