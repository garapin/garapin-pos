part of 'list_customer_cubit.dart';

@freezed
class ListCustomerState with _$ListCustomerState {
  const factory ListCustomerState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      String? err,
      @Default([]) List<Mitra> allMitra}) = _ListCustomerState;
}
