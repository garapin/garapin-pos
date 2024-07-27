part of 'report_transaction_cubit.dart';

@freezed
class ReportTransactionState with _$ReportTransactionState {
  const factory ReportTransactionState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<FilterStoreTransaction> filterTemplate,
    ReportTransaction? transaction,
    String? startDate,
    String? endDate,
    Store? store,
    String? targetDatabase,
  }) = _ReportTransactionState;
}
