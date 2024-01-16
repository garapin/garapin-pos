part of 'create_product_cubit.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    XFile? pickedImage,
  }) = _CreateProductState;
}
