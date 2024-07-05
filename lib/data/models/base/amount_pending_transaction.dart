import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_pending_transaction.g.dart';

@JsonSerializable()
class AmountPendingTransaction {
  @JsonKey(name: "amount")
  int? amount;

  AmountPendingTransaction({
    this.amount,
  });

  factory AmountPendingTransaction.fromJson(Map<String, dynamic> json) => _$AmountPendingTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$AmountPendingTransactionToJson(this);
}