part of 'report_transaction_cubit.dart';

@freezed
class ReportTransactionState with _$ReportTransactionState {
  const factory ReportTransactionState(
      {@Default(DataStateStatus.initial) DataStateStatus status,
      @Default([]) List<TransactionReportData> transaction,
      @Default([]) List<FilterStoreTransaction> filterTemplate,
      String? param,
      String? startDate,
      String? endDate,
      String? targetDatabase,
      Store? store,
      TotalTransaction? totalTransaction,
      @Default(false) bool canLoadMore,
      String? err}) = _ReportTransactionState;
}
