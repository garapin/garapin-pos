part of 'dashboard_teknisi_cubit.dart';

@freezed
class DashboardTeknisiState with _$DashboardTeknisiState {
  const factory DashboardTeknisiState({
    required Widget currentScreen,
    required int currentTab,
  }) = _DashboardTeknisiState;
}
