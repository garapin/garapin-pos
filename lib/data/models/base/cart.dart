import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "id_product")
  int? idProduct;
  @JsonKey(name: "imei")
  String? imei;
  @JsonKey(name: "no_sn")
  String? noSn;
  @JsonKey(name: "no_product")
  String? noProduct;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "id_user")
  int? idUser;

  Cart({
    this.id,
    this.idProduct,
    this.imei,
    this.noSn,
    this.noProduct,
    this.status,
    this.created,
    this.updated,
    this.idUser,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
