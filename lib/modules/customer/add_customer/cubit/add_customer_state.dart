part of 'add_customer_cubit.dart';

@freezed
class AddCustomerState with _$AddCustomerState {
  const factory AddCustomerState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
  }) = _AddCustomerState;
}
