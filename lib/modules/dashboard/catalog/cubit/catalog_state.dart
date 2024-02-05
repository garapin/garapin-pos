part of 'catalog_cubit.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Store? store,
  }) = _CatalogState;
}
