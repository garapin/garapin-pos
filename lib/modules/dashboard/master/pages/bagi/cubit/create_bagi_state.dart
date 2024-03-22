part of 'create_bagi_cubit.dart';

@freezed
class CreateBagiState with _$CreateBagiState {
  const factory CreateBagiState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Store? store,
    RoutePayments? routePayments,
    @Default([]) List<DatabaseStore> merchants,
    SplitPaymentTemplate? paymentTemplate,
  }) = _CreateBagiState;
}
