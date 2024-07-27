part of 'report_transaction_by_payment_method_cubit.dart';

@freezed
class ReportTransactionByPaymentMethodState with _$ReportTransactionByPaymentMethodState {
  const factory ReportTransactionByPaymentMethodState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<FilterStoreTransaction> filterTemplate,
    ReportTransactionByPaymentMethod? transaction,
    String? startDate,
    String? endDate,
    Store? store,
    String? targetDatabase,
  }) = _ReportTransactionByPaymentMethodState;
}