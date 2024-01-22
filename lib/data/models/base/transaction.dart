// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transaction.g.dart';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

@JsonSerializable()
class Transaction {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "no_surat_jalan")
  String? noSuratJalan;
  @JsonKey(name: "transaction_purpose")
  String? transactionPurpose;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "notes")
  String? notes;
  @JsonKey(name: "signature_image")
  String? signatureImage;
  @JsonKey(name: "instalation_image")
  List<String>? instalationImage;
  @JsonKey(name: "status_transaction")
  String? statusTransaction;
  @JsonKey(name: "teknisi")
  List<Teknisi>? teknisi;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "id_user")
  int? idUser;
  @JsonKey(name: "created_by")
  String? createdBy;

  Transaction({
    this.id,
    this.noSuratJalan,
    this.transactionPurpose,
    this.quantity,
    this.notes,
    this.signatureImage,
    this.instalationImage,
    this.statusTransaction,
    this.teknisi,
    this.created,
    this.updated,
    this.idUser,
    this.createdBy,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class Teknisi {
  @JsonKey(name: "username")
  String? username;

  Teknisi({
    this.username,
  });

  factory Teknisi.fromJson(Map<String, dynamic> json) =>
      _$TeknisiFromJson(json);

  Map<String, dynamic> toJson() => _$TeknisiToJson(this);
}
