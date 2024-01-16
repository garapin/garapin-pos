part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<Item> product,
    @Default(1) int page,
    @Default(false) bool canLoadMore,
  }) = _ProductDetailState;
}
