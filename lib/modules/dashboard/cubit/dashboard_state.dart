part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Store? store,
    @Default(0) int index,
    @Default(SizedBox()) Widget widget,
    @Default(false) showCreateProduct,
    User? user,
  }) = _DashboardState;
}
