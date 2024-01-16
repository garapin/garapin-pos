part of 'detail_transaction_cubit.dart';

@freezed
class DetailTransactionState with _$DetailTransactionState {
  const factory DetailTransactionState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<Cart> item,
    TransactionDetail? transaction,
  }) = _DetailTransactionState;
}
