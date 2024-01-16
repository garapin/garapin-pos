part of 'catalog_cubit.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      String? err,
      @Default([]) List<Product> catalog,
      @Default(1) int page,
      @Default("AKTIF") String statusProduct,
      @Default(false) bool canLoadMore,
      @Default(false) bool showGrid}) = _CatalogState;
}
