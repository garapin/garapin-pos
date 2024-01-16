part of 'add_to_cart_cubit.dart';

@freezed
class AddToCartState with _$AddToCartState {
  const factory AddToCartState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? error,
    String? noProduct,
    String? imei,
    String? noSn,
    TypeScan? typeScan,
  }) = _AddToCartState;
}
