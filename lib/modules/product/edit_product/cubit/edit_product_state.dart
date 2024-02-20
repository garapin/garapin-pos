part of 'edit_product_cubit.dart';

@freezed
class EditProductState with _$EditProductState {
  const factory EditProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? error,
    XFile? pickedImage,
    @Default([]) List<String> listIcon,
    @Default([]) List<CategoryProduct> category,
    @Default([]) List<Brand> brand,
    @Default([]) List<Unit> unit,
    Product? product,
    String? selectedIcon,
  }) = _EditProductState;
}
