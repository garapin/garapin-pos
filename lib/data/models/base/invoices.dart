// To parse this JSON data, do
//
//     final invoices = invoicesFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'invoices.g.dart';

@JsonSerializable()
class Invoices {
  @JsonKey(name: "product")
  InvoicesProduct? product;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "invoice_label")
  String? invoiceLabel;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "payment_date")
  dynamic paymentDate;
  @JsonKey(name: "webhook")
  dynamic webhook;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Invoices({
    this.product,
    this.invoice,
    this.invoiceLabel,
    this.status,
    this.paymentMethod,
    this.paymentDate,
    this.webhook,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Invoices.fromJson(Map<String, dynamic> json) =>
      _$InvoicesFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicesToJson(this);
}

@JsonSerializable()
class InvoicesProduct {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "items")
  List<Item>? items;
  @JsonKey(name: "total_price")
  int? totalPrice;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "user")
  String? user;

  InvoicesProduct({
    this.id,
    this.items,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.user,
  });

  factory InvoicesProduct.fromJson(Map<String, dynamic> json) =>
      _$InvoicesProductFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicesProductToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "product")
  ItemProduct? product;
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
class ItemProduct {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "status")
  String? status;
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

  ItemProduct({
    this.id,
    this.name,
    this.sku,
    this.image,
    this.icon,
    this.discount,
    this.price,
    this.status,
    this.brandRef,
    this.categoryRef,
    this.unitRef,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ItemProduct.fromJson(Map<String, dynamic> json) =>
      _$ItemProductFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProductToJson(this);
}
