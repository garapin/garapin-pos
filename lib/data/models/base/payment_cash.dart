// To parse this JSON data, do
//
//     final paymentCash = paymentCashFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'payment_cash.g.dart';

@JsonSerializable()
class PaymentCash {
  @JsonKey(name: "invoice")
  Invoice? invoice;
  @JsonKey(name: "refund")
  int? refund;

  PaymentCash({
    this.invoice,
    this.refund,
  });

  factory PaymentCash.fromJson(Map<String, dynamic> json) =>
      _$PaymentCashFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCashToJson(this);
}

@JsonSerializable()
class Invoice {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "product")
  InvoiceProduct? product;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "invoice_label")
  String? invoiceLabel;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "payment_date")
  DateTime? paymentDate;
  @JsonKey(name: "webhook")
  Webhook? webhook;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Invoice({
    this.id,
    this.product,
    this.invoice,
    this.invoiceLabel,
    this.status,
    this.paymentMethod,
    this.paymentDate,
    this.webhook,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

@JsonSerializable()
class InvoiceProduct {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "items")
  List<Item>? items;
  @JsonKey(name: "user")
  String? user;
  @JsonKey(name: "total_price")
  int? totalPrice;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  InvoiceProduct({
    this.id,
    this.items,
    this.user,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory InvoiceProduct.fromJson(Map<String, dynamic> json) =>
      _$InvoiceProductFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceProductToJson(this);
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

@JsonSerializable()
class Webhook {
  @JsonKey(name: "amount_paid")
  int? amountPaid;
  @JsonKey(name: "total_price")
  int? totalPrice;
  @JsonKey(name: "refund")
  int? refund;

  Webhook({
    this.amountPaid,
    this.totalPrice,
    this.refund,
  });

  factory Webhook.fromJson(Map<String, dynamic> json) =>
      _$WebhookFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookToJson(this);
}
