part of 'history_transaction_cubit.dart';

@freezed
class HistoryTransactionState with _$HistoryTransactionState {
  const factory HistoryTransactionState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<Invoices> inv,
    String? err,
  }) = _HistoryTransactionState;
}
