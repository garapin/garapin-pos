import 'package:json_annotation/json_annotation.dart';
part 'transaction_item.g.dart';

@JsonSerializable()
class TransactionItem {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_transaction")
  String? idTransaction;
  @JsonKey(name: "id_product_item")
  String? idProductItem;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "id_user")
  String? idUser;

  TransactionItem({
    this.id,
    this.idTransaction,
    this.idProductItem,
    this.created,
    this.updated,
    this.idUser,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}
