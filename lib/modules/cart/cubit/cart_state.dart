part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      Cart? cart,
      String? invoces,
      @Default(false) bool isCheckout,
      String? err}) = _CartState;
}
