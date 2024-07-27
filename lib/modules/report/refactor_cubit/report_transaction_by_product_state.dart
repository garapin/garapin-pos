part of 'report_transaction_by_product_cubit.dart';

@freezed
class ReportTransactionByProductState with _$ReportTransactionByProductState {
  const factory ReportTransactionByProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<FilterStoreTransaction> filterTemplate,
    ReportTransactionByProduct? transaction,
    String? startDate,
    String? endDate,
    Store? store,
    String? targetDatabase,
  }) = _ReportTransactionByPaymentMethodState;
}