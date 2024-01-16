part of 'add_product_cubit.dart';

enum TypeScan { sn, imei, noProduct }

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? error,
    String? noProduct,
    String? imei,
    String? noSn,
    TypeScan? typeScan,
    @Default([]) List<Product> filterCatalog,
  }) = _AddProductState;
}
