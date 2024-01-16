part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<Cart> cart,
    @Default([]) List<String> selectedItem,
  }) = _CartState;
}
