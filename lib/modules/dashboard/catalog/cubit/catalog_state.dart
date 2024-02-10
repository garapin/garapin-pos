part of 'catalog_cubit.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      Store? store,
      @Default([]) List<CategoryProduct> category,
      @Default([]) List<Product> product}) = _CatalogState;
}
