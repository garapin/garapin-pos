part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default(0) int index,
    @Default(CatalogPage()) Widget widget,
  }) = _DashboardState;
}
