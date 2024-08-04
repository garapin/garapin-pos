part of 'report_transaction_bagi_bagi_cubit.dart';

@freezed
class ReportTransactionBagiBagiState with _$ReportTransactionBagiBagiState {
  const factory ReportTransactionBagiBagiState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<FilterStoreTransaction> filterTemplate,
    ReportTransactionBagiBagi? transaction,
    String? startDate,
    String? endDate,
    Store? store,
    String? targetDatabase,
  }) = _ReportTransactionBagiBagiState;
}