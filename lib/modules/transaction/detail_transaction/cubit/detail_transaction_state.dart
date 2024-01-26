part of 'detail_transaction_cubit.dart';

@freezed
class DetailTransactionState with _$DetailTransactionState {
  const factory DetailTransactionState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? err,
    @Default([]) List<TransactionItem> item,
    Transaction? transaction,
    @Default([]) List<InstalationVehicle> listInstalationVehicle,
    @Default(ShowItemType.bring) ShowItemType showItemType,
  }) = _DetailTransactionState;
}
