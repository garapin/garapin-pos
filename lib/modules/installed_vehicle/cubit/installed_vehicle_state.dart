part of 'installed_vehicle_cubit.dart';

@freezed
class InstalledVehicleState with _$InstalledVehicleState {
  const factory InstalledVehicleState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<InstalationVehicle> instalationVehicle,
    String? err,
  }) = _InstalledVehicleState;
}
