part of 'list_transaction_teknisi_cubit.dart';

@freezed
class ListTransactionTeknisiState with _$ListTransactionTeknisiState {
  const factory ListTransactionTeknisiState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default("ALL") String filterStatus,
    @Default([]) List<Transaction> listTransaction,
  }) = _ListTransactionTeknisiState;
}
