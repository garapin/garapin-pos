part of 'my_merchant_cubit.dart';

@freezed
class MyMerchantState with _$MyMerchantState {
  const factory MyMerchantState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<DatabaseStore> merchants,
  }) = _MyMerchantState;
}
