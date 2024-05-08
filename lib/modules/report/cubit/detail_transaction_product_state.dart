part of 'detail_transaction_product_cubit.dart';

@freezed
class DetailTransactionProductState with _$DetailTransactionProductState {
  const factory DetailTransactionProductState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Invoices? invoice,
    String? trxName,
    String? err,
    String? fee,
    String? tax,
  }) = _DetailTransactionProductState;
}
