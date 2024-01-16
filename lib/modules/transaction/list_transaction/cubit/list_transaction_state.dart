part of 'list_transaction_cubit.dart';

@freezed
class ListTransactionState with _$ListTransactionState {
  const factory ListTransactionState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<Transaction> listTransaction,
  }) = _ListTransactionState;
}
