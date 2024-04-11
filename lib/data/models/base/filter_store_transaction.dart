// To parse this JSON data, do
//
//     final filterStoreTransaction = filterStoreTransactionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'filter_store_transaction.g.dart';

@JsonSerializable()
class FilterStoreTransaction {
  @JsonKey(name: "db_name")
  String? dbName;
  @JsonKey(name: "email_owner")
  String? emailOwner;
  @JsonKey(name: "store_name")
  String? storeName;
  @JsonKey(name: "account_id")
  String? accountId;
  @JsonKey(name: "template_id")
  String? templateId;
  @JsonKey(name: "template_name")
  String? templateName;
  @JsonKey(name: "template_status")
  String? templateStatus;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;

  FilterStoreTransaction({
    this.dbName,
    this.emailOwner,
    this.storeName,
    this.accountId,
    this.templateId,
    this.templateName,
    this.templateStatus,
    this.created,
    this.updated,
  });

  factory FilterStoreTransaction.fromJson(Map<String, dynamic> json) =>
      _$FilterStoreTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$FilterStoreTransactionToJson(this);
}
