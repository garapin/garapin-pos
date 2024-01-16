import 'package:json_annotation/json_annotation.dart';

part 'transaction_detail.g.dart';

@JsonSerializable()
class TransactionDetail {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "no_surat_jalan")
  String? noSuratJalan;
  @JsonKey(name: "transaction_purpose")
  String? transactionPurpose;
  @JsonKey(name: "notes")
  String? notes;
  @JsonKey(name: "signature_image")
  String? signatureImage;
  @JsonKey(name: "status_transaction")
  String? statusTransaction;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "id_user")
  int? idUser;
  @JsonKey(name: "created_by")
  String? createdBy;

  TransactionDetail({
    this.id,
    this.noSuratJalan,
    this.transactionPurpose,
    this.notes,
    this.signatureImage,
    this.statusTransaction,
    this.created,
    this.updated,
    this.idUser,
    this.createdBy,
  });

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailToJson(this);
}
