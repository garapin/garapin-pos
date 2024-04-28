import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'check_amount_withdraw.g.dart';

@JsonSerializable()
class CheckAmountWithdraw {
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "total_fee")
  int? totalFee;
  @JsonKey(name: "amount_to_bank")
  int? amountToBank;

  CheckAmountWithdraw({
    this.amount,
    this.totalFee,
    this.amountToBank,
  });

  factory CheckAmountWithdraw.fromJson(Map<String, dynamic> json) =>
      _$CheckAmountWithdrawFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAmountWithdrawToJson(this);
}
