part of 'catalog_cubit.dart';

enum ModeCatalog { edit, cashier }

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      Store? store,
      String? search,
      String? selectCategory,
      @Default(ModeCatalog.cashier) ModeCatalog modeCatalog,
      @Default([]) List<CategoryProduct> category,
      @Default([]) List<Product> product}) = _CatalogState;
}
