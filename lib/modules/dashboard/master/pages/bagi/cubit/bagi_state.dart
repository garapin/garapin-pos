part of 'bagi_cubit.dart';

enum BagiView { list, create, detail }

@freezed
class BagiState with _$BagiState {
  const factory BagiState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      Store? store,
      @Default([]) List<SplitPaymentTemplate> paymentTemplate,
      @Default([]) List<RoutePayments>? routePayment,
      @Default([]) List<DatabaseStore> merchants,
      String? id,
      @Default(BagiView.list) BagiView bagiView}) = _BagiState;
}
