import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "items")
  List<Item>? items;
  @JsonKey(name: "user")
  String? user;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Cart({
    this.id,
    this.items,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "product")
  ProductCart? product;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "_id")
  String? id;

  Item({
    this.product,
    this.quantity,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class ProductCart {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "brand_ref")
  String? brandRef;
  @JsonKey(name: "category_ref")
  String? categoryRef;
  @JsonKey(name: "unit_ref")
  String? unitRef;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  ProductCart({
    this.id,
    this.name,
    this.sku,
    this.image,
    this.discount,
    this.price,
    this.brandRef,
    this.categoryRef,
    this.unitRef,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) =>
      _$ProductCartFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartToJson(this);
}
