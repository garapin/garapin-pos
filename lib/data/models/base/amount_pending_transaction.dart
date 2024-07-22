import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_pending_transaction.g.dart';

@JsonSerializable()
class AmountPendingTransaction {
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "quickReleaseCost")
  int? costQuickRelease;
  @JsonKey(name: "feeUsingQR")
  int? feeUsingQR;
  @JsonKey(name: "feeUsingVA")
  int? feeUsingVA;
  @JsonKey(name: "totalPaymentUsingQR")
  int? totalPaymentUsingQR;
  @JsonKey(name: "totalPaymentUsingVA")
  int? totalPaymentUsingVA;

  AmountPendingTransaction({
    this.amount,
    this.costQuickRelease,
    this.feeUsingQR,
    this.feeUsingVA,
  });

  factory AmountPendingTransaction.fromJson(Map<String, dynamic> json) => _$AmountPendingTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$AmountPendingTransactionToJson(this);
}