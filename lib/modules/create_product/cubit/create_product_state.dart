part of 'create_product_cubit.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? error,
    XFile? pickedImage,
    @Default([]) List<CategoryProduct> category,
    @Default([]) List<Brand> brand,
    @Default([]) List<Unit> unit,
  }) = _CreateProductState;
}
