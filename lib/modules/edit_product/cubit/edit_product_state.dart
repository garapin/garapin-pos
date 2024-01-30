part of 'edit_product_cubit.dart';

@freezed
class EditProductState with _$EditProductState {
  const factory EditProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Product? product,
    String? err,
    XFile? pickedImage,
  }) = _Initial;
}
