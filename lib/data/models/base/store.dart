import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "store_name")
  String? storeName;
  @JsonKey(name: "pic_name")
  dynamic picName;
  @JsonKey(name: "address")
  dynamic address;
  @JsonKey(name: "city")
  dynamic city;
  @JsonKey(name: "country")
  dynamic country;
  @JsonKey(name: "postal_code")
  dynamic postalCode;
  @JsonKey(name: "store_image")
  dynamic storeImage;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Store({
    this.id,
    this.storeName,
    this.picName,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.storeImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
