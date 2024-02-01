part of 'list_vehicle_installed_cubit.dart';

@freezed
class ListVehicleInstalledState with _$ListVehicleInstalledState {
  const factory ListVehicleInstalledState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<Vehicle> vehicle,
    String? err,
  }) = _ListVehicleInstalledState;
}
